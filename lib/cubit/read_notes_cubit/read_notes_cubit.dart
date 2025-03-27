import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:quotes_app/constants.dart';
import 'package:quotes_app/models/quote_model_data_base.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());

  List<DataBaseQuoteModel>? quotes;
  void readAllNotes() async {
    // I don't need the Loading state here because reading data from the box is not a future operation

    var quotesBox = Hive.box<DataBaseQuoteModel>(kQuotesBox);
    quotes = quotesBox.values
        .toList(); // value is a getter that return all the values in the box
    emit(ReadNotesSuccess()); // refresh the UI
  }
}
