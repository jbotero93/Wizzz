import 'package:flutter/material.dart';
import 'package:wizzz/gif/domain/models/gif_model.dart';
import 'package:wizzz/gif/external/gif_external.dart';

class GifProvider with ChangeNotifier {
  final allGifs = ValueNotifier<GifModel?>(null);
  final gifFieldController =
      ValueNotifier<TextEditingController>(TextEditingController());

  Future<GifModel> getAllGifs() async {
    return await GifExternal().getAllGifs().then((value) {
      allGifs.value = value;
      notifyListeners();
      return value;
    });
  }

  Future<GifModel> getSearchedGifs({required String query}) async {
    return await GifExternal().getSearchedGifs(query: query).then((value) {
      allGifs.value = value;
      notifyListeners();
      return value;
    });
  }
}
