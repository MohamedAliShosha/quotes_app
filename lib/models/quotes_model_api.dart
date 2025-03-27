class QuoteModel {
  final String quote;

  final String author;

  QuoteModel({required this.quote, required this.author});

  factory QuoteModel.fromJson(json) {
    return QuoteModel(
      quote: json['q'],
      author: json['a'],
    );
  }
}
