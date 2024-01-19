import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            Text(
              "WELCOME TO OHEL SHARE",
              style: TextStyle(
                fontSize: 29,
                background: Paint()
                  ..color = Colors.blue
                  ..strokeWidth = 20
                  ..strokeJoin = StrokeJoin.round
                  ..strokeCap = StrokeCap.round
                  ..style = PaintingStyle.fill
                  ..style = PaintingStyle.stroke,
                height: 10,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String phoneNumber = phoneNumberController.text;
              },
              child: const Text('Send'),
            ),
          ],
          //TODO set a length for the input
          //TODO make it start with 05
        ),
      ),
    );
  }
}