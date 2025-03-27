import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/cubit/read_notes_cubit/read_notes_cubit.dart';
import 'package:quotes_app/models/quote_model_data_base.dart';
import 'package:quotes_app/widgets/custom_appBar.dart';
import 'package:quotes_app/widgets/custom_text_field.dart';

// Any widget in flutter is immutable
class EditQuotePageBody extends StatefulWidget {
  const EditQuotePageBody({super.key, required this.quote});
  final DataBaseQuoteModel quote; // The quote to be edited
  @override
  State<EditQuotePageBody> createState() => _EditQuotePageBodyState();
}

class _EditQuotePageBodyState extends State<EditQuotePageBody> {
  String? quote, author; // The quote and author to be edited
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.quote.quote = quote ??
                  widget.quote.quote; // if the quote is null use the old quote
              widget.quote.author = author ??
                  widget
                      .quote.author; // if the author is null use the old author
              widget.quote
                  .save(); // Save the quote => Save metgod comes from the hive object I inherited
              BlocProvider.of<ReadNotesCubit>(context)
                  .readAllNotes(); // Refresh the list
              Navigator.pop(context); // Pop the page
            },
            title: 'Edit Quote',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextFormField1(
            onChanged: (value) {
              quote = value;
            },
            hintText: widget.quote.quote,
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField1(
            onChanged: (value) {
              author = value;
            },
            hintText: widget.quote.author,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
