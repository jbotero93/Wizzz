import 'package:flutter_test/flutter_test.dart';
import 'package:wizzz/gif/domain/models/gif_model.dart';
import 'package:wizzz/gif/external/gif_external.dart';

void main() {
  test('gifAllGet', () async {
    expect(await GifExternal().getAllGifs(), isA<GifModel>());
  });

  test('gifSearchedGet', () async {
    final result = await GifExternal().getSearchedGifs(query: 'hola');

    expect(result, isA<GifModel>());
  });
}
