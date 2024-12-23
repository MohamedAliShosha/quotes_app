import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quotes_app/models/quotes_model.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.quotes,
  });

  final List<QuoteModel> quotes;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: quotes.length, // Number of quotes to display
      itemBuilder: (context, index) {
        final quote = quotes[index];

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image or header
              Padding(
                padding: const EdgeInsets.only(top: 200, left: 25),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/quote.png',
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
              ),
              // Quote text
              const SizedBox(height: 50),
              Text(
                quote.quote,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Author of the quote
              Text(
                '- ${quote.author}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Icon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
