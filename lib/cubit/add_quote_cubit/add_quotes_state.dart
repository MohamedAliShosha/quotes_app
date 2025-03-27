part of 'add_quotes_cubit.dart';

@immutable
sealed class AddQuotesState {}

final class AddQuotesInitial extends AddQuotesState {}

final class AddQuotesLoading extends AddQuotesState {}

final class AddQuotesSuccess extends AddQuotesState {}

final class AddQuotesError extends AddQuotesState {
  final String errorMessage;
  AddQuotesError(this.errorMessage);
}
