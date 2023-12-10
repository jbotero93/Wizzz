import 'dart:convert';

import 'package:wizzz/api_utils/api_config.dart';
import 'package:wizzz/gif/domain/models/gif_model.dart';
import 'package:http/http.dart' as http;

class GifExternal {
  Future<GifModel> getAllGifs() async {
    String url = ApiConfig.apiBase(isSearch: false);
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return GifModel.fromJson(jsonDecode(response.body));
  }

  Future<GifModel> getSearchedGifs({required String query}) async {
    String url = ApiConfig.apiBase(isSearch: true, query: query);
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return GifModel.fromJson(jsonDecode(response.body));
  }
}
