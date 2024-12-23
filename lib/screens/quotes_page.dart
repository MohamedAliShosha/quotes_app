import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotes_app/cubit/quotes_cubit.dart';

import 'package:quotes_app/widgets/custom_page_view.dart';

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
            return CustomPageView(quotes: quotes);
          } else if (state is QuotesError) {
            return Center(child: Text(state.errorMessage));
          }
          return const SizedBox.shrink(); // used
        },
      ),
    );
  }
}
