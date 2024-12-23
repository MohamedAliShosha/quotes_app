import 'package:flutter/material.dart';

import 'package:quotes_app/widgets/intro_screen_custom_body.dart';

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
      body: IntroScreenCustomBody(isVisible: _isVisible),
    );
  }
}
