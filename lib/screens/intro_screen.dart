import 'package:flutter/material.dart';
import 'package:quotes_app/widgets/custom_gesture_detector.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  static String id = 'IntroPage';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // تشغيل الأنيميشن بعد تأخير بسيط
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF9F6),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: Image.asset(
                'assets/quote.png',
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: const Text(
                'Get',
                style: TextStyle(height: .5, fontSize: 50, fontFamily: 'Lato'),
              ),
            ),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration:
                  const Duration(seconds: 3), // النص الثاني يظهر بعد مدة أطول
              child: const Text(
                'Inspired',
                style: TextStyle(
                  fontSize: 50, // responsive font size
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            const Spacer(),
            const SizedBox(
              width: double.infinity,
            ),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 3),
              child: const CustomGestureDetecor(),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

  // scale factor
  // responsive fontsize
  // min , max fontsize
  // This make the font responsive
//   double getResponsiveFontSize(BuildContext context,
//       {required double fontSize}) {
//     double scaleFactor = getScaleFactor(context);
//     double responsiveFontSize = fontSize * scaleFactor;

//     double lowerLimit = fontSize * 0.8;
//     double upperLimit = fontSize * 1.2;

//     return responsiveFontSize.clamp(lowerLimit, upperLimit);
//   }
// }

// double getScaleFactor(BuildContext context) {
//   double width = MediaQuery.sizeOf(context).width;

//   if (width < 600) {
//     return width / 400;
//   } else if (width < 900) {
//     {
//       return width / 700;
//     }
//   } else {
//     return width / 1000;
//   }

