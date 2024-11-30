part of 'quotes_cubit.dart';

sealed class QuotesState {}

final class QuotesInitial extends QuotesState {}

final class QuotesLoading extends QuotesState {}

final class QuotesLoaded extends QuotesState {
  final List<QuoteModel> quotes;

  QuotesLoaded({required this.quotes});
}

final class QuotesError extends QuotesState {
  final String errorMessage;

  QuotesError({required this.errorMessage});
}
