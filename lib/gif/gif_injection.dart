import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizzz/gif/domain/gif_provider.dart';
import 'package:wizzz/gif/interface/git_page.dart';

class GifInjection {
  GifInjection._();

  static Widget injection() {
    return ListenableProvider<GifProvider>(
      create: (context) => GifProvider()..getAllGifs(),
      child: const GifPage(),
    );
  }
}
