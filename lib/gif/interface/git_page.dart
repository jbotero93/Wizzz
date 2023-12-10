import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wizzz/gif/domain/gif_provider.dart';
import 'package:wizzz/gif/interface/widget/gif_card_widget.dart';

class GifPage extends StatelessWidget {
  const GifPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gifProvider = Provider.of<GifProvider>(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        title: Text(
          'Wizzz',
          style: GoogleFonts.oswald(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: gifProvider.gifFieldController.value,
                onChanged: (value) async {
                  if (value.isEmpty) {
                    await gifProvider.getAllGifs();
                  } else {
                    await gifProvider.getSearchedGifs(query: value);
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.blueAccent,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.2),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            flex: 10,
            child: Container(
              color: Colors.grey.shade300,
              child: ValueListenableBuilder(
                valueListenable: gifProvider.allGifs,
                builder: (context, allGifs, snapshot) {
                  return MasonryGridView.count(
                    crossAxisCount: 2,
                    itemCount: allGifs?.data?.length,
                    itemBuilder: (context, index) {
                      return GifCardWidget(
                        gif: allGifs?.data?[index],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
