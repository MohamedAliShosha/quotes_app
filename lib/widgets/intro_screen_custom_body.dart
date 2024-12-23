import 'package:flutter/material.dart';
import 'package:quotes_app/widgets/custom_gesture_detector.dart';

class IntroScreenCustomBody extends StatelessWidget {
  const IntroScreenCustomBody({
    super.key,
    required bool isVisible,
  }) : _isVisible = isVisible;

  final bool _isVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
