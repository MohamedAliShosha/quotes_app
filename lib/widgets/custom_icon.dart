import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, this.icon, this.onPressed});

  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            color: Colors.black,
            icon,
            size: 28,
          ),
        ),
      ),
    );
  }
}
