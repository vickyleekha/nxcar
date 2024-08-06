import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nxcar/Screens/OTP.dart';

import 'package:nxcar/utils/utill.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormFieldState>();
  final _formKey1 = GlobalKey<FormFieldState>();
  final _formKey2 = GlobalKey<FormFieldState>();
  final _formKey3 = GlobalKey<FormFieldState>();

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
      body: Form(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: ListView(
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
                    key: _formKey,
                    controller: number,
                    keyboardType: TextInputType.number,
                    decoration: decoration(
                        focusNode: _focus1,
                        hintText: "Enter Your number",
                        string: name.text),
                    focusNode: _focus1,
                    onChanged: (value) {
                      formKey(_formKey, _formKey1, _formKey2, _formKey3,1)
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTP(phone: number.text),
                              ))
                          : null;
                    },
                    validator: (value) => validator(value, 1),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 342,
                  child: TextFormField(
                    key: _formKey1,
                    decoration: decoration(
                        focusNode: _focus,
                        hintText: 'Enter your name',
                        string: name.text),
                    focusNode: _focus,
                    onChanged: (value) {
                      formKey(_formKey, _formKey1, _formKey2, _formKey3,2)
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTP(phone: number.text),
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
                    key: _formKey2,
                    decoration: decoration(
                      focusNode: _focus2,
                      hintText: 'Enter Your Email',
                      string: email.text,
                    ),
                    focusNode: _focus2,
                    onChanged: (value) {
                      formKey(_formKey, _formKey1, _formKey2, _formKey3,3)
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTP(phone: number.text),
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
                    key: _formKey3,
                    textCapitalization: TextCapitalization.characters,
                    decoration: decoration(
                        focusNode: _focus3,
                        hintText: 'Enter your vehicle number',
                        string: vehicle.text),
                    focusNode: _focus3,
                    onChanged: (value) {
                      formKey(_formKey, _formKey1, _formKey2, _formKey3,4)
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTP(phone: number.text),
                              ))
                          : null;
                    },
                    validator: (value) => validator(value, 4),
                    controller: vehicle,
                    keyboardType: TextInputType.name,
                  )),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 40,
                width: 342,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(65, 203, 195, 1),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: TextButton(
                  onPressed: () {
                    if (formKey(_formKey, _formKey1, _formKey2, _formKey3,5)) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTP(
                              phone: number.text,
                            ),
                          ));
                    }
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                        fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
