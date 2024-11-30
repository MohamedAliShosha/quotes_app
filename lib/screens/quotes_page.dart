import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:quotes_app/cubit/quotes_cubit.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});
  static String id = 'QuotesPage';

  @override
  Widget build(BuildContext context) {
    // Fetch the quotes data when the page is built
    BlocProvider.of<QuotesCubit>(context).getQuotes();

    return Scaffold(
      backgroundColor: const Color(0xffFAF9F6),
      body: BlocBuilder<QuotesCubit, QuotesState>(
        builder: (context, state) {
          if (state is QuotesInitial) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (state is QuotesLoaded) {
            final quotes = state.quotes;

            // PageView for horizontal scrolling between quotes
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
          } else if (state is QuotesError) {
            return Center(child: Text(state.errorMessage));
          }
          return const SizedBox.shrink(); // used
        },
      ),
    );
  }
}
