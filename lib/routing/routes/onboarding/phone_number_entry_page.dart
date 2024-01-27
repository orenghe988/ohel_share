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

class PhoneNumberEntryPage extends StatefulWidget {
  const PhoneNumberEntryPage({super.key});

  @override
  State<PhoneNumberEntryPage> createState() => _PhoneNumberEntryPageState();
}

class _PhoneNumberEntryPageState extends State<PhoneNumberEntryPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = "05";
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // const Image(
            //   image: NetworkImage(
            //       'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            // ),
            const _UpperText(),
            // const SizedBox(height: 70),
            OurTextInput(
              controller: _controller,
              isLtr: true,
              icon: const Icon(Icons.phone_rounded),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            // const SizedBox(height: 30),
            const ExpandedButton(
              text: "הבא",
            ),
          ],
        ),
      ),
    );
  }
}
