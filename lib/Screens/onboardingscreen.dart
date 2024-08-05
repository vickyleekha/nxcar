import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_up.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var currentIndex = 0;

  List textList = [
    'Buy a Pre Owned Car with Confidence',
    'Rev Up Your Dreams with Our Used Car Loans',
    'Simplified Used Car Financing with Nxcar'
  ];
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Timer? timer;
  int _start = 3;

//timer for animation
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentIndex == 2 ? startTimer() : timer;
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            width: 101,
            height: 22.49,
            margin: const EdgeInsets.only(top: 24, left: 16),
            child: SvgPicture.asset(
              'assets/nxcar.svg',
            ),
          ),
          Container(
            height: 523,
            width: 523,
            margin: const EdgeInsets.only(
              top: 72,
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.png"))),
          ),

          // for apply animation  in app
          AnimatedContainer(
            width: 149,
            height: 75.36,
            duration: const Duration(seconds: 1),

            //conditon to check where to move image
            margin: currentIndex == 1
                ? const EdgeInsets.only(top: 292, left: 128)
                : currentIndex == 2 && _start == 3
                    ? const EdgeInsets.only(top: 430, left: 4)
                    : _start == 2
                        ? const EdgeInsets.only(top: 472, left: 242)
                        : _start == 1
                            ? const EdgeInsets.only(top: 63, left: 227)
                            : _start == 0
                                ? const EdgeInsets.only(top: 63, left: 227)
                                : const EdgeInsets.only(top: 149, left: 0),
            child: SvgPicture.asset(
              'assets/pic1.svg',
            ),
          ),
          AnimatedContainer(
            width: 118.42,
            height: 101.21,
            duration: const Duration(seconds: 1),
            margin: currentIndex == 1
                ? const EdgeInsets.only(top: 136, left: 7)
                : _start == 0
                    ? const EdgeInsets.only(top: 414, left: 12)
                    : _start == 1
                        ? const EdgeInsets.only(top: 414, left: 12)
                        : currentIndex == 2 && _start == 3
                            ? const EdgeInsets.only(top: 136, left: 7)
                            : _start == 2
                                ? const EdgeInsets.only(top: 136, left: 7)
                                : const EdgeInsets.only(top: 274, left: 129),
            child: SvgPicture.asset(
              'assets/pic2.svg',
            ),
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            margin: currentIndex == 2 && _start == 3
                ? const EdgeInsets.only(top: 279, left: 139)
                : _start == 0
                    ? const EdgeInsets.only(top: 456, left: 254)
                    : _start == 1
                        ? const EdgeInsets.only(top: 456, left: 254)
                        : _start == 2
                            ? const EdgeInsets.only(top: 414, left: 17)
                            : const EdgeInsets.only(top: 421, left: 5),
            child: SvgPicture.asset(
              'assets/pic3.svg',
              width: 108,
              height: 108,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            margin: _start == 0
                ? const EdgeInsets.only(top: 267, left: 118)
                : _start == 1
                    ? const EdgeInsets.only(top: 267, left: 118)
                    : _start == 2
                        ? const EdgeInsets.only(top: 267, left: 118)
                        : currentIndex == 2 && _start == 3
                            ? const EdgeInsets.only(top: 458, left: 214)
                            : const EdgeInsets.only(top: 458, left: 214),
            child: SvgPicture.asset(
              'assets/pic4.svg',
              width: 161.1,
              height: 115,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            margin: _start == 0
                ? const EdgeInsets.only(top: 136, left: 12)
                : _start == 1
                    ? const EdgeInsets.only(top: 136, left: 12)
                    : const EdgeInsets.only(top: 45, left: 231),
            child: SvgPicture.asset(
              'assets/pic5.svg',
              width: 130,
              height: 111.43,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 619,
            ),
            child: Text(
              textList[currentIndex],
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 28,
                  decoration: TextDecoration.none),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 721),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80,
                  height: 12,
                  margin: const EdgeInsets.only(left: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 0; i < 3; i++)
                          i == currentIndex
                              ? Container(
                                  margin: const EdgeInsets.only(left: 3),
                                  height: 12,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(65, 203, 195, 1),
                                      borderRadius: BorderRadius.circular(20)))
                              : Container(
                                  margin: const EdgeInsets.only(left: 3),
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          217, 217, 217, 1),
                                      borderRadius: BorderRadius.circular(50))),
                      ]),
                ),
                TextButton(
                  child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(65, 203, 195, 1),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )),
                  onPressed: () {
                    setState(() {
                      //  check for which page we are in after last page
                      // navigate to login screen
                      currentIndex < 2
                          ? currentIndex++
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ));
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
