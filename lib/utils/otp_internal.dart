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
  final resendOTP;
  Color topColor;
  Color bottomColor;
  final Color titleColor;
  final Color themeColor;
  final Color keyboardBackgroundColor;
  final Widget icon;

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
    this.themeColor = Colors.black,
    this.titleColor = Colors.black,
    required this.icon,
    required this.keyboardBackgroundColor,
    this.resendOTP,
    required this.bottomColor,
    required this.topColor,
    required this.phone,
  });

  OtpScreen.withGradientBackground(
      {required Key key,
      this.title = "Enter Your OTP",
      this.subTitle = "4-digit number has been sent to your mobile number",
      this.otpLength = 4,
      this.resendOTP,
      required this.validateOtp,
      required this.routeCallback,
      this.themeColor = Colors.black,
      this.titleColor = Colors.black,
      required this.topColor,
      required this.bottomColor,
      required this.keyboardBackgroundColor,
      required this.icon,
      required this.phone})
      : super(key: key);

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen>
    with SingleTickerProviderStateMixin {
  Size? _screenSize;
  List<String>? otpValues;
  bool showLoadingButton = false;

  @override
  void initState() {
    otpValues = List<String>.filled(widget.otpLength, '', growable: false);
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
      widget.phone,
      textAlign: TextAlign.start,
      style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          letterSpacing: 0.68,
          color: Color(0xFF171634)),
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
        children: getOtpTextWidgetList(),
      ),
    );
  }

  /// Return Resend Button
  get _getResendButton {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: TextButton(
          onPressed: widget.resendOTP,
          child: const Text(
            "Resend ",
            style: TextStyle(
                fontFamily: "NotoSans",
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF67A7ED)),
          )),
    );
  }

  /// Returns otp fields of length [widget.otpLength]
  List<Widget> getOtpTextWidgetList() {
    List<Widget> optList = [];
    for (int i = 0; i < widget.otpLength; i++) {
      optList.add(_otpTextField(otpValues![i]));
    }
    return optList;
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
            margin: const EdgeInsets.only(top: 10),
            height: 40,
            width: 342,
            child: ElevatedButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
                // }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(65, 203, 195, 1),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(2))),
              child: const Text(
                "Next",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w700,
                    fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Returns "Otp text field"
  Widget _otpTextField(String digit) {
    return Container(
      height: 48,
      width: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(6)),
      child: Text(
        digit != '' ? digit : "",
        style: TextStyle(
          fontSize: 30.0,
          color: widget.titleColor,
        ),
      ),
    );
  }

  ///to clear otp when error occurs
  void clearOtp() {
    otpValues = List<String>.filled(widget.otpLength, '', growable: false);
    setState(() {});
  }

  ///to show error  message
  showToast(BuildContext context, String msg) {}
}
