import 'package:flutter/material.dart';
import 'package:quotes_app/models/quote_model_data_base.dart';
import 'package:quotes_app/widgets/edit_quote_page_body.dart';

class EditQuotePage extends StatelessWidget {
  const EditQuotePage({super.key, required this.quote});

  final DataBaseQuoteModel quote; // The quote to be edited
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditQuotePageBody(
        quote: quote,
      ),
    );
  }
}
