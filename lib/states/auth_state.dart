import "dart:async";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:supabase_flutter/supabase_flutter.dart";

sealed class OurAuthState {}

final class SignedOut implements OurAuthState {}

final class SignedIn implements OurAuthState {
  final User user;

  SignedIn({required this.user});
}

final class PendingOtpVerification implements OurAuthState {
  final String phoneNumber;

  PendingOtpVerification({required this.phoneNumber});
}

class AuthCubit extends Cubit<OurAuthState> {
  late final StreamSubscription<AuthState> _authStateChangeSubscription;

  AuthCubit({required SupabaseClient supabase}) : super(supabase.auth.currentUser == null ? SignedOut() : SignedIn(user: supabase.auth.currentUser!)) {
    _authStateChangeSubscription = supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      emit(switch (event) {
        AuthChangeEvent.signedOut || AuthChangeEvent.userDeleted => SignedOut(),
        AuthChangeEvent.signedIn || AuthChangeEvent.userUpdated => SignedIn(user: supabase.auth.currentUser!),
        _ => state
      });
    });
  }

  @override
  Future<void> close() async {
    await _authStateChangeSubscription.cancel();
    await super.close();
  }
}