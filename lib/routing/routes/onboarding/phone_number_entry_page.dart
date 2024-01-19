import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "../../../common/buttons/expanded_button.dart";

class PhoneNumberEntryPage extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();

  PhoneNumberEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              text: "continue",
            ),
          ],
          //TODO set a length for the input
          //TODO make it start with 05
        ),
      ),
    );
  }
}
