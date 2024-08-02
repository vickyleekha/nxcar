import 'package:flutter/material.dart';

// this class is made for using utility function

//Custom text feild because all text field are same

// customTextField({
//   String? hintText,
//   TextEditingController? controller,
//   TextInputType? keyboardType,
//   required int field,
//   required FocusNode focusNode,
//   required BuildContext context,
//   required GlobalKey<FormState> formKey,
// }) {
//   return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       style: const TextStyle(
//         color: Colors.black,
//       ),
//       focusNode: focusNode,
//       onChanged: (value) {
//         formKey.currentState!.validate() == true
//             ? Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => OTP(phone: phone!),
//                 ))
//             : null;
//       },
//       decoration: InputDecoration(
//           filled: true,
//           fillColor: focusNode.hasFocus
//               ? const Color.fromRGBO(224, 255, 250, 1)
//               : const Color.fromRGBO(247, 250, 248, 1),
//           contentPadding: const EdgeInsets.all(8),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(
//                   color: Color.fromRGBO(111, 121, 120, 1), width: 0.2)),
//           focusedBorder: const OutlineInputBorder(
//             borderSide:
//                 BorderSide(width: 1, color: Color.fromRGBO(224, 255, 250, 1)),
//           ),
//           errorBorder: const OutlineInputBorder(
//             borderSide: BorderSide(width: 1, color: Colors.red),
//           ),

//           // Rich text is use to color astrick mark
//           label: RichText(
//             text: TextSpan(
//                 text: hintText,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14,
//                     color: Color.fromRGBO(154, 165, 177, 1)),
//                 children: [
//                   TextSpan(
//                       text: focusNode.hasFocus ? '' : ' *',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                         color: Colors.red,
//                       ))
//                 ]),
//           ),

//           //The label will float when the input is focused
//           floatingLabelBehavior: FloatingLabelBehavior.auto),
//       validator: (value) => validator(value, field));
// }

decoration({focusNode, hintText}) => InputDecoration(
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
                text: focusNode.hasFocus ? '' : ' *',
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
        return "Please add Phone No.";
      } else if (!regExp.hasMatch(value)) {
        return "Phone No. Invalid";
      } else if (value.length != 10) {
        return "Phone No. Invalid";
      }
    case 2:
      if (value!.isEmpty) {
        return "Name not be empty";
      }
    case 3:
      if (value!.isEmpty) {
        return 'EmailId Not Be Empty';
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
        return 'Please enter vehicle number';
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

      String pattern = r"^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$";
      r"^[0-9]{2}BH[0-9]{4}[A-HJ-NP-Z]{1,2}$";
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value!)) {
        return "Enter Valid Vehicle Number";
      }
  }
}
