import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "../../../common/text_input.dart";
import "../../../common/buttons/expanded_button.dart";

class _UpperText extends StatelessWidget {
  const _UpperText();

  @override
  Widget build(BuildContext context) {
    // TODO ADD OHEL SHARE IMAGE, ABOVE ALL
    // TODO ADD PHONE ICON TO TEXT FIELD
    return Container(
        child: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w600,
            letterSpacing: -.5,
          ),
          "ברוכים הבאים",
        ),
        Text(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black38,
          ),
          "הזינו את מספר הטלפון שלכם כדי להתחבר",
        ),
      ],
    ));
  }
}

class PhoneNumberEntryPage extends StatelessWidget {
  const PhoneNumberEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
            _UpperText(),
            SizedBox(height: 70),
            OurTextInput(isLtr: true, icon: Icon(Icons.phone_rounded)),
            SizedBox(height: 30),
            ExpandedButton(width: 200, text: "הבא"),
          ],
        ),
      ),
    );
  }
}

int x = 5;
