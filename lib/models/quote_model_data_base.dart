import 'package:hive/hive.dart';

part 'quote_model_data_base.g.dart';

@HiveType(typeId: 0) // Hive type of this object in data base
class DataBaseQuoteModel extends HiveObject {
  @HiveField(0) // hive field is unique per class
  String quote;
  @HiveField(1)
  String author;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  DataBaseQuoteModel(
      {required this.quote,
      required this.author,
      required this.date,
      required this.color});
}
