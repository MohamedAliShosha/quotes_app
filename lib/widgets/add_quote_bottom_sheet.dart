import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/cubit/add_quote_cubit/add_quotes_cubit.dart';
import 'package:quotes_app/cubit/read_notes_cubit/read_notes_cubit.dart';
import 'package:quotes_app/widgets/add_quote_form.dart';

class AddQuoteBottomSheet extends StatefulWidget {
  const AddQuoteBottomSheet({super.key});

  @override
  State<AddQuoteBottomSheet> createState() => _AddQuoteBottomSheetState();
}

class _AddQuoteBottomSheetState extends State<AddQuoteBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Removing the Multi Bloc Provider from MaterialApp then using a single bloc provider it here
      create: (context) => AddQuotesCubit(),
      child: BlocConsumer<AddQuotesCubit, AddQuotesState>(
        listener: (context, state) {
          if (state is AddQuotesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
          if (state is AddQuotesSuccess) {
            BlocProvider.of<ReadNotesCubit>(context)
                .readAllNotes(); // To add the new quote to the list on the screen immediately
            Navigator.pop(context); // close the bottom sheet
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddQuotesLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16, right: 16,
                bottom: MediaQuery.of(context)
                    .viewInsets
                    .bottom, // to make the bottom sheet above the keyboard
              ),
              child: const SingleChildScrollView(
                child: AddQuoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
