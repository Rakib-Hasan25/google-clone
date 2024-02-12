// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:googleclone/service/api_service.dart';
import 'package:googleclone/utils/color.dart';
import 'package:googleclone/widgets/Search_tabs.dart';
import 'package:googleclone/widgets/search_footer.dart';
import 'package:googleclone/widgets/search_result_component.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
    this.start = '0',
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

TextEditingController searchController = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Title(
      color: Colors.blue, // This is required
      title: widget.searchQuery,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WebSearchHeader(textt: widget.searchQuery,),
                    Padding(
                        padding: EdgeInsets.only(
                            left: size.width <= 768 ? 10 : 150.0),
                        child: const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SearchTabs(),
                        )),
                    const Divider(
                      height: 0,
                      thickness: 0,
                    ),
                    FutureBuilder<Map<String, dynamic>>(
                      future: ApiService().fetchData(
                          context: context,
                          queryTerm: widget.searchQuery,
                          start: widget.start),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          //
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // showing the time it took to fetch results
                              Container(
                                padding: EdgeInsets.only(
                                    left: size.width <= 768 ? 10 : 150,
                                    top: 12),
                                child: Text(
                                  "About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF70757a),
                                  ),
                                ),
                              ),
                              // displaying the results
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data?['items'].length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width <= 768 ? 10 : 150,
                                        top: 10),
                                    child: SearchResultComponent(
                                      linkToGo: snapshot.data?['items'][index]
                                          ['link'],
                                      link: snapshot.data?['items'][index]
                                          ['formattedUrl'],
                                      text: snapshot.data?['items'][index]
                                          ['title'],
                                      desc: snapshot.data?['items'][index]
                                          ['snippet'],
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 30),
                              // pagination
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: widget.start != "0"
                                            ? () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        SearchScreen(
                                                      searchQuery:
                                                          widget.searchQuery,
                                                      start: (int.parse(widget
                                                                  .start) -
                                                              10)
                                                          .toString(),
                                                      
                                                    ),
                                                  ),
                                                );
                                              }
                                            : () {},
                                        child: const Text(
                                          "< Prev",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: blueColor,
                                          ),
                                        )),
                                    const SizedBox(width: 30),
                                    TextButton(
                                      child: const Text(
                                        "Next >",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: blueColor,
                                        ),
                                      ),
                                      // if start is 0, we are on the first page
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SearchScreen(
                                              searchQuery: widget.searchQuery,
                                              start:
                                                  (int.parse(widget.start) + 10)
                                                      .toString(),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              const SearchFooter(),
                            ],
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class WebSearchHeader extends StatelessWidget {
  const WebSearchHeader({
    super.key,
    required this.textt,
  });

  final String textt;

  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 15, top: 4),
          child: Image.asset(
            "assets/images/google-logo.png",
            height: 30,
          ),
        ),
        const SizedBox(width: 27),
        SizedBox(
          width: size.width > 768 ? size.width * 0.4 : size.width * 0.6,
          child: TextFormField(
            initialValue: textt,
            style: const TextStyle(fontSize: 16),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: searchBorder)),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/images/mic-icon.svg',
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: blueColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
            onFieldSubmitted: (text) {
              if (text.trim() != "") {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(
                      searchQuery: text.trim(),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
