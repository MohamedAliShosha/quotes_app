import 'package:flutter/material.dart';
import 'package:quotes_app/models/quotes_model_api.dart';
import 'package:quotes_app/widgets/custom_displayed_quote_item.dart';

class CustomQuotesListView extends StatelessWidget {
  const CustomQuotesListView({
    super.key,
    required this.quotes,
  });

  final List<QuoteModel> quotes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quotes.length, // Number of quotes to display
      itemBuilder: (context, index) {
        final quote = quotes[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
          child: CustomDisplayedQuoteItem(quote: quote),
        );
      },
    );
  }
}
