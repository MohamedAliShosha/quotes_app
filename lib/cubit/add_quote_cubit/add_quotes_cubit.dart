import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotes_app/constants.dart';
import 'package:quotes_app/models/quote_model_data_base.dart';

part 'add_quotes_state.dart';

class AddQuotesCubit extends Cubit<AddQuotesState> {
  AddQuotesCubit() : super(AddQuotesInitial());

  Color color = const Color(0xff6B4B3E); // Default color of the quote

  void addQuote(DataBaseQuoteModel quote) async {
    quote.color = color.value; // converting the color to int
    emit(AddQuotesLoading());
    try {
      var quoteBox =
          Hive.box<DataBaseQuoteModel>(kQuotesBox); // get the quotes box

      await quoteBox.add(
          quote); // add the quote to the box , add method accept a dynamic object
      emit(AddQuotesSuccess());
    } catch (e) {
      emit(AddQuotesError(e.toString()));
      debugPrint(e.toString());
    }
  }
}
