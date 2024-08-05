import 'dart:async';

import 'package:flutter/material.dart';

import '../Screens/home_page.dart';
// import 'package:toast/toast.dart';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  final String title;
  final String subTitle;
  final Future<String> Function(String) validateOtp;
  final void Function(BuildContext) routeCallback;

  // default [otpLength] is 4
  final int otpLength;

  final phone;

  OtpScreen({
    super.key,
    this.title = "Enter Your OTP",
    this.subTitle = "4-digit number has been sent to your mobile number",
    this.otpLength = 4,
    required this.validateOtp,
    required this.routeCallback,
    required this.phone,
  });

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen>
    with SingleTickerProviderStateMixin {
  Size? _screenSize;

  bool showLoadingButton = false;
  TextEditingController? contrller1;
  TextEditingController? contrller2;
  TextEditingController? contrller3;
  TextEditingController? contrller4;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: _screenSize!.width,
        child: _getInputPart,
      ),
    );
  }

  /// Return Title label
  get _getTitleText {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        widget.title,
        textAlign: TextAlign.start,
        style: const TextStyle(
            fontFamily: "NotoSans",
            fontWeight: FontWeight.w500,
            fontSize: 24,
            letterSpacing: 0.15,
            color: Color(0xFF171634)),
      ),
    );
  }

  /// Return subTitle label
  get _getSubtitleText {
    return Text(
      widget.phone.toString().replaceRange(2, 8, '*' * 6),
      textAlign: TextAlign.start,
      style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          letterSpacing: 0.15,
          color: Colors.grey),
    );
  }

  /// Return "OTP" input fields
  get _getInputField {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _textFieldOTP(
            first: true,
            last: false,
            controllerr: contrller1,
          ),
          _textFieldOTP(
            first: false,
            last: false,
            controllerr: contrller2,
          ),
          _textFieldOTP(
            first: false,
            last: false,
            controllerr: contrller3,
          ),
          _textFieldOTP(
            first: false,
            last: true,
            controllerr: contrller4,
          ),
        ],
      ),
    );
  }

  /// Return Resend Button
  get _getResendButton {
    return const SizedBox(
      height: 20,
      child: Text(
        "Resend ",
        style: TextStyle(
            letterSpacing: 0.25,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF67A7ED)),
      ),
    );
  }

  /// Returns Otp screen views
  get _getInputPart {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getTitleText,
          _getSubtitleText,
          _getInputField,
          _getResendButton,
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 40,
            width: 342,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(65, 203, 195, 1),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: TextButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
                // }
              },
              child: const Text(
                "Next",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Returns "Otp text field"
  Widget _textFieldOTP(
      {bool? first, last, TextEditingController? controllerr}) {
    return SizedBox(
      width: 48,
      height: 48,
      child: TextField(
        controller: controllerr,
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: const Offstage(),
          contentPadding: const EdgeInsets.all(8),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(111, 121, 120, 1)),
              borderRadius: BorderRadius.circular(4)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(111, 121, 120, 1)),
              borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }

  ///to show error  message
  showToast(BuildContext context, String msg) {}
}
