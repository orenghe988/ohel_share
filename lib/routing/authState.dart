import "package:flutter_bloc/flutter_bloc.dart";
import "package:supabase_flutter/supabase_flutter.dart";

sealed class AuthState {}

class LoggedOut extends AuthState {}

class LoggedIn extends AuthState {
  final User user;

  LoggedIn({required this.user});
}

class PendingOtpVerification extends AuthState {
  final String phoneNumber;

  PendingOtpVerification({required this.phoneNumber});
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({User? user})
      : super(user is User ? LoggedIn(user: user) : LoggedOut()) {
    Supabase.instance.client.auth.onAuthStateChange
        .listen((data) => emit(switch (data.event) {
              AuthChangeEvent.signedIn ||
              AuthChangeEvent.userUpdated =>
                LoggedIn(user: data.session!.user),
              AuthChangeEvent.signedOut ||
              AuthChangeEvent.userDeleted =>
                LoggedOut(),
              _ => state,
            }));
  }
}
