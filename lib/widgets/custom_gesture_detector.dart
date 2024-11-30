import 'package:flutter/material.dart';
import 'package:quotes_app/screens/login_page.dart';

class CustomGestureDetecor extends StatelessWidget {
  const CustomGestureDetecor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
      ),
      // width: 60,
      height: 60,
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, LoginPage.id);
          },
          child: const Text(
            'Let\'s Go',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
