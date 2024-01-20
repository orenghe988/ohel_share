import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "../../../common/buttons/expanded_button.dart";

class _UpperText extends StatelessWidget {
  const _UpperText({super.key});

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
              fontSize: 42,
              fontWeight: FontWeight.w600,
              letterSpacing: -.5,
            ),
            "ברוכים הבאים",
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black38,
            ),
            "[תיאור האפליקציה]",
          ),
        ],
      ),
    );
  }
}

class PhoneNumberEntryPage extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();

  PhoneNumberEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const _UpperText(),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 10,
              controller: TextEditingController(text: "05"),
              decoration: const InputDecoration(
                hintStyle: TextStyle(fontSize: 10.0),
                labelText: 'Enter Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const ExpandedButton(
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
