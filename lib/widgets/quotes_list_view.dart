import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/cubit/read_notes_cubit/read_notes_cubit.dart';
import 'package:quotes_app/models/quote_model_data_base.dart';
import 'package:quotes_app/widgets/custom_quote_item.dart';

class QuotesListView extends StatelessWidget {
  const QuotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        List<DataBaseQuoteModel> quotes =
            BlocProvider.of<ReadNotesCubit>(context).quotes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: quotes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              child: CustomQuoteItem(
                quote: quotes[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
