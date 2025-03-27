import 'package:flutter/material.dart';

class CustomAddQuoteButton extends StatelessWidget {
  const CustomAddQuoteButton({super.key, this.onTap, this.isLoading = false});

  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : const Text(
                  'Add a Quote',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }
}
