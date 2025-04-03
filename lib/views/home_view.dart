import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/views/quotes_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomePage';
  static FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: firebaseAnalytics);

  // Function to log event when button is pressed
  void logExploreQuotesEvent() {
    // A function to log an event when the "Explore Quotes" button is pressed
    firebaseAnalytics.logEvent(
      name: "explore_quotes_clicked",
      parameters: {
        "screen": "home_view",
        "action": "button_pressed",
        "button_name": "Explore Quotes",
        "timestamp":
            DateTime.now().toIso8601String() // Log the current timestamp
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF9F6),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/quote.png',
                  fit: BoxFit.contain,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
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
            ElevatedButton(
              onPressed: () {
                logExploreQuotesEvent(); // Log event when button is pressed
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
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
