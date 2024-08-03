import 'package:flutter/material.dart';
import 'package:nxcar/utils/otp_Internal.dart';

class OTP extends StatefulWidget {
  final String phone;

  const OTP({super.key, required this.phone});

  @override
  OTPState createState() => OTPState(phone: phone);
}

class OTPState extends State<OTP> {
  bool registered = false;
  final String phone;
  var verId;
  Key key = const Key("OTP");

  OTPState({required this.phone});

  var loading = false;

  @override
  Widget build(BuildContext context) {
    if (!registered) {
      registered = true;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: OtpScreen(
          otpLength: 4,
          validateOtp: (otp) async {
            if (verId == null) {
              return "Please enter correct otp";
            }

            var user = "";

            if (user == "") {
              return "Invalid OTP!";
            } else {
              setState(() {
                loading = true;
              });
              return Future.value("");
            }
          },
          subTitle: "Please Enter OTP Sent To $phone",
          routeCallback: (context) {},
          key: key,
          phone: widget.phone,
        ));
  }
}
