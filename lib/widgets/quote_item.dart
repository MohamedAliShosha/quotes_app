import 'package:flutter/material.dart';

class QuoteItem extends StatelessWidget {
  const QuoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Removed Spacer widgets and added appropriate SizedBox
          Image.asset(
            'assets/quote.png',
            height: 40,
            width: 40,
          ),
          const SizedBox(
            height: 65,
          ),
          const SizedBox(
            width: double.infinity,
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
