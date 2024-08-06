import 'package:flutter/material.dart';

// this class is made for using utility function

//custom decoration for text field
decoration({focusNode, hintText, required String string}) => InputDecoration(
    filled: true,
    fillColor: focusNode.hasFocus
        ? const Color.fromRGBO(224, 255, 250, 1)
        : const Color.fromRGBO(247, 250, 248, 1),
    contentPadding: const EdgeInsets.all(8),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
            color: Color.fromRGBO(111, 121, 120, 1), width: 0.2)),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color.fromRGBO(224, 255, 250, 1)),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),

    // Rich text is use to color astrick mark
    label: RichText(
      text: TextSpan(
          text: hintText,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color.fromRGBO(154, 165, 177, 1)),
          children: [
            TextSpan(
                text: focusNode.hasFocus
                    ? ''
                    : string.isNotEmpty
                        ? ''
                        : ' *',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.red,
                ))
          ]),
    ),

    //The label will float when the input is focused
    floatingLabelBehavior: FloatingLabelBehavior.auto);

// validation function for text field
validator(value, field) {
  switch (field) {
    case 1:
      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regExp = RegExp(pattern);

      if (value!.isEmpty) {
        return "Please add Phone Number";
      } else if (!regExp.hasMatch(value)) {
        return "Phone No. Invalid";
      } else if (value.length != 10) {
        return "Phone No. Invalid";
      }
    case 2:
      final nameRegExp = RegExp(r"^[\p{L} ,.'-]*$",
          caseSensitive: false, unicode: true, dotAll: true);

      return value.isEmpty
          ? 'Please Enter Your Name'
          : nameRegExp.hasMatch(value)
              ? null
              : 'Enter a Valid Name';
    case 3:
      if (value!.isEmpty) {
        return 'Please Enter your Email Id';
      }
      String pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return "Enter Valid EmailId";
      }
    case 4:
      if (value!.isEmpty) {
        return 'Please Enter Vehicle Number';
      }

// ^ means start of string
// [A-Z]{2} means 2 characters in the range of A through Z
// \s means white space
// [0-9]{2} means 2 characters in the range of 0 through 9
// \s means white space
// [A-Z]{2} means 2 characters in the range of A through Z
// \s means white space
// [0-9]{4} means 4 characters in the range of 0 through 9
// $ means end of string

      String pattern = r"^[A-Z]{2}[0-9,A-Z]{1,2}[A-HJ-NP-Z]{1,2}[0-9]{4}$";
      String pattern1 = r"^[0-9]{2}BH[0-9]{4}[A-HJ-NP-Z]{1,2}$";
      RegExp regex = RegExp(pattern);
      RegExp regex1 = RegExp(pattern1);

      var match =
          regex.hasMatch(value!) || regex1.hasMatch(value!) ? true : false;
      if (!match) {
        return "Enter Valid Vehicle Number";
      }
  }
}

formKey(formKey, formKey1, formKey2, formKey3, int field) {
  bool all = formKey.currentState!.validate() &&
      formKey1.currentState!.validate() &&
      formKey2.currentState!.validate() &&
      formKey3.currentState!.validate();

  switch (field) {
    case 1:
      if (formKey.currentState!.validate()) {
        return all;
      }

    case 2:
      if (formKey1.currentState!.validate()) {
        return all;
      }
    case 3:
      if (formKey2.currentState!.validate()) {
        return all;
      }
    case 4:
      if (formKey3.currentState!.validate()) {
        return all;
      }
    case 5:
      return all;
  }
}
