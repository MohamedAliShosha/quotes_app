import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quotes_app/cubit/read_notes_cubit/read_notes_cubit.dart';
import 'package:quotes_app/models/quote_model_data_base.dart';
import 'package:quotes_app/views/edit_quote_view.dart';

class CustomQuoteItem extends StatelessWidget {
  const CustomQuoteItem({super.key, required this.quote});
  final DataBaseQuoteModel quote;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditQuotePage(
              quote: quote,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: Color(quote.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                quote.quote,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                ),
                child: Text(
                  quote.author,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  quote.delete(); // Delete the quote
                  BlocProvider.of<ReadNotesCubit>(context)
                      .readAllNotes(); // Refresh the list
                },
                icon: Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black.withOpacity(0.4),
                  size: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                quote.date,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
