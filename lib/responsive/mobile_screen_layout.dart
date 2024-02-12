import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:googleclone/utils/color.dart';
import 'package:googleclone/widgets/mobile/mobile_footer.dart';
import 'package:googleclone/widgets/web/translation_buttons.dart';
import 'package:googleclone/widgets/web/web_search.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            leading: const Icon(
              Icons.menu,
              color: primaryColor,
            ),
            title: SizedBox(
              width: size.width * 0.4,
              child: const DefaultTabController(
                  length: 2,
                  child: TabBar(
                      labelColor: blueColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: blueColor,
                      tabs: [
                        Tab(text: 'ALL'),
                        Tab(text: 'IMAGES'),
                      ])),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                  ),
                  icon: SvgPicture.asset(
                    "/images/more-apps.svg",
                    color: primaryColor,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {},
                  color: const Color.fromARGB(255, 30, 134, 186),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        0.0), // Adjust the radius as needed
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ]),




            
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.25,
              ),
              const Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Search(),
                          SizedBox(
                            height: 20,
                          ),
                          TranslationButtons()
                        ],
                      ),
                      MobileFooter()
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
