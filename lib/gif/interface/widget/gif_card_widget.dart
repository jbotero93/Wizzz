import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wizzz/gif/domain/models/gif_model.dart';

// ignore: must_be_immutable
class GifCardWidget extends StatelessWidget {
  const GifCardWidget({super.key, required this.gif});
  final Data? gif;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.parse(gif?.images?.original?.height ?? '150') + 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              gif?.title ?? 'Undefined',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.nunito(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            child: gif?.images?.original?.url == null
                ? Container(
                    padding: const EdgeInsets.all(20),
                    height: 100,
                    width: 100,
                    child: const CircularProgressIndicator(),
                  )
                : Image.network(
                    gif!.images!.original!.url!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, image) {
                      return image == null
                          ? child
                          : Container(
                              padding: const EdgeInsets.all(20),
                              height: 100,
                              width: 100,
                              child: const CircularProgressIndicator(),
                            );
                    },
                  ),
          ),
          Container(),
        ],
      ),
    );
  }
}
