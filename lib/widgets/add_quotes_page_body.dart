import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/cubit/read_notes_cubit/read_notes_cubit.dart';
import 'package:quotes_app/widgets/custom_appBar.dart';
import 'package:quotes_app/widgets/quotes_list_view.dart';

class AddQuotesPageBody extends StatefulWidget {
  const AddQuotesPageBody({super.key});

  @override
  State<AddQuotesPageBody> createState() => _AddQuotesPageBodyState();
}

class _AddQuotesPageBodyState extends State<AddQuotesPageBody> {
  @override
  void initState() {
    BlocProvider.of<ReadNotesCubit>(context).readAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Your Quotes',
          ),
          Expanded(
            child: QuotesListView(),
          ),
        ],
      ),
    );
  }
}
