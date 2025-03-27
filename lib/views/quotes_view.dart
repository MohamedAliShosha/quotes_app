import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/constants.dart';

import 'package:quotes_app/cubit/fetching_quotes_cubit/quotes_cubit.dart';
import 'package:quotes_app/views/add_quotes_view.dart';

import 'package:quotes_app/widgets/custom_quotes_list_view.dart';

class QuotesView extends StatelessWidget {
  const QuotesView({super.key});
  static String id = 'QuotesPage';

  @override
  Widget build(BuildContext context) {
    // Fetch the quotes data when the page is built
    BlocProvider.of<QuotesCubit>(context).getQuotes();

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.home,
                color: Colors.black,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddQuotesView.id);
              },
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.black,
              ),
            ),
            label: 'Add Quote',
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
            return CustomQuotesListView(quotes: quotes);
          } else if (state is QuotesError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
