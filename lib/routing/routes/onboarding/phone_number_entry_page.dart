import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "../../../common/text_input.dart";
import "../../../common/buttons/expanded_button.dart";

class _UpperText extends StatelessWidget {
  const _UpperText();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(
            height: 5,
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
      ),
    );
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _UpperText(),
            OurTextInput(),
            ExpandedButton(
              text: "הבא",
            ),
          ],
          //TODO set a length for the input
          //TODO make it start with 05
        ),
      ),
    );
  }
}

int x = 5;
