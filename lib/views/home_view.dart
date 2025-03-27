import 'package:flutter/material.dart';
import 'package:quotes_app/views/quotes_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF9F6),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add an image or illustration at the top
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/quote.png', // Replace with your asset path
                  fit: BoxFit.contain,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            // Add a welcome message
            const Text(
              'Discover and Add Your Favorite Quotes!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Add a description or motivational text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                'Browse through inspiring quotes or add your own to share with others!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Add a button to navigate to the Quotes page
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, QuotesView.id);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'Explore Quotes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Add some spacing at the bottom
            Expanded(
              flex: 1,
              child:
                  Container(), // Empty container to add spacing at the bottom
            ),
          ],
        ),
      ),
    );
  }
}
