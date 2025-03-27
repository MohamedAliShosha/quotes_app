import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/models/quotes_model_api.dart';
import 'package:quotes_app/services/quote_service.dart';

part 'quotes_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  QuotesCubit() : super(QuotesInitial());

  Future<void> getQuotes() async {
    try {
      final quotes = await QuotesService(dio: Dio()).getQuotes();
      emit(QuotesLoaded(quotes: quotes));
    } catch (e) {
      emit(QuotesError(errorMessage: e.toString()));
    }
  }
}
