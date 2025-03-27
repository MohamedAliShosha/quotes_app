import 'package:flutter/material.dart';

import 'package:quotes_app/constants.dart';
import 'package:quotes_app/widgets/add_quote_bottom_sheet.dart';
import 'package:quotes_app/widgets/add_quotes_page_body.dart';

class AddQuotesView extends StatelessWidget {
  const AddQuotesView({super.key});

  static String id = 'AddQuotesPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled:
                  true, // to make the bottom sheet above the keyboard
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddQuoteBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const AddQuotesPageBody(),
    );
  }
}
