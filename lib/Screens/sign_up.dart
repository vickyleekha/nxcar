import 'package:flutter/material.dart';
import 'package:nxcar/Screens/OTP.dart';

import 'package:nxcar/utils/utill.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController vehicle = TextEditingController();
  var error = false;

  final FocusNode _focus = FocusNode();
  final FocusNode _focus1 = FocusNode();
  final FocusNode _focus2 = FocusNode();
  final FocusNode _focus3 = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    _focus1.addListener(_onFocusChange);
    _focus2.addListener(_onFocusChange);
    _focus3.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    _focus1.removeListener(_onFocusChange);
    _focus1.dispose();
    _focus2.removeListener(_onFocusChange);
    _focus2.dispose();
    _focus3.removeListener(_onFocusChange);
    _focus3.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void _onFocusChange() {
    setState(() {});
    debugPrint("Focus: ${_focus1.hasFocus.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 32,
                    width: 342,
                    child: const Text(
                      "Welcome back!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          letterSpacing: 0.36,
                          fontFamily: "DMSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Color(0xFF171634)),
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 342,
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "Please fill out the details",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          letterSpacing: 0.68,
                          fontFamily: "DMSans",
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color(0xFF171634)),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 342,
                      child: TextFormField(
                        controller: number,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: decoration(
                            focusNode: _focus1, hintText: "Enter Your number"),
                        focusNode: _focus1,
                        onChanged: (value) {
                          _formKey.currentState!.validate() == true
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OTP(phone: number.text),
                                  ))
                              : null;
                        },
                        validator: (value) => validator(value, 1),
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 342,
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: decoration(
                          focusNode: _focus,
                          hintText: 'Enter your name',
                        ),
                        focusNode: _focus,
                        onChanged: (value) {
                          _formKey.currentState!.validate() == true
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OTP(phone: number.text),
                                  ))
                              : null;
                        },
                        validator: (value) => validator(value, 2),
                        controller: name,
                        keyboardType: TextInputType.name,
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 342,
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: decoration(
                          focusNode: _focus2,
                          hintText: 'Enter Your Email',
                        ),
                        focusNode: _focus2,
                        onChanged: (value) {
                          _formKey.currentState!.validate() == true
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OTP(phone: number.text),
                                  ))
                              : null;
                        },
                        validator: (value) => validator(value, 3),
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 342,
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: decoration(
                          focusNode: _focus3,
                          hintText: 'Enter your vehicle number',
                        ),
                        focusNode: _focus3,
                        onChanged: (value) {
                          _formKey.currentState!.validate() == true
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OTP(phone: number.text),
                                  ))
                              : null;
                        },
                        validator: (value) => validator(value, 4),
                        controller: vehicle,
                        keyboardType: TextInputType.name,
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 40,
                    width: 342,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTP(
                                  phone: number.text,
                                ),
                              ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(65, 203, 195, 1),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
