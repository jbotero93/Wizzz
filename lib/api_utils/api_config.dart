class ApiConfig {
  ApiConfig._();

  static String apiBase({required bool isSearch, String? query}) {
    if (isSearch == true && query != null && query.isNotEmpty) {
      return 'https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$query&limit=$limit&offset=$offset&rating=g&lang=$lang&random_id=$randomId&bundle=messaging_non_clips';
    } else {
      return 'https://api.giphy.com/v1/gifs/trending?api_key=$apiKey&limit=$limit&offset=$offset&rating=g&random_id=$randomId&bundle=messaging_non_clip';
    }
  }

  static const String apiKey = 'BIb0IMG3YPqwE9ZARNxP4ZJBIkvNu3k2';

  static const String limit = '30';

  static const String offset = '5';

  static const String randomId = 'e826c9fc5c929e0d6c6d423841a282aa';

  static const String lang = 'es';
}
