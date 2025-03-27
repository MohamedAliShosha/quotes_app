import 'package:flutter/material.dart';

import 'package:quotes_app/widgets/intro_screen_custom_body.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  static String id = 'IntroPage';

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
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
      body: IntroScreenCustomBody(isVisible: _isVisible),
    );
  }
}
