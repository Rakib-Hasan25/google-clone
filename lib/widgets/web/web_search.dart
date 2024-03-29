import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:googleclone/screens/search_screen.dart';
import 'package:googleclone/utils/color.dart';




TextEditingController searchController = TextEditingController();

class Search extends StatelessWidget {
  const Search({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
      

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
          "/images/google-logo.png",
          height: size.height * 0.12,
        )),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: size.width > 768
              ? size.width * 0.4
              : size.width * 0.9,
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      const BorderSide(color: searchBorder)),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  '/images/search-icon.svg',
                  color: searchBorder,
                  width: 1,
                  height: 1,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/images/mic-icon.svg',
                ),
              ),
            ),
            onFieldSubmitted: (val) {
              if (val != "") {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
    
                     SearchScreen(
                      searchQuery: val.trim(),
                    ),
                  ),
                );
              }
            },
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}