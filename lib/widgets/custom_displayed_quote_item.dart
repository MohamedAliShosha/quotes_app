import 'package:flutter/material.dart';
import 'package:quotes_app/models/quotes_model_api.dart';

class CustomDisplayedQuoteItem extends StatelessWidget {
  const CustomDisplayedQuoteItem({
    super.key,
    required this.quote,
  });

  final QuoteModel quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
      decoration: BoxDecoration(
        color: const Color(0xffFFD6AF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/quote.png',
                height: 24,
                width: 24,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Column(
              children: [
                Text(
                  quote.quote,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  quote.author,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
