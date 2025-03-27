import 'package:dio/dio.dart';
import 'package:quotes_app/models/quotes_model_api.dart';

class QuotesService {
  final Dio dio;
  final String baseUrl = 'https://zenquotes.io/api/quotes';

  QuotesService({required this.dio}); // Create a Dio instance

  Future<List<QuoteModel>> getQuotes() async {
    try {
      final Response response = await dio.get(baseUrl);

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> quotes = response.data;

        return quotes.map((json) => QuoteModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load quotes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("failed to get quotes: $e");
    }
  }
}
