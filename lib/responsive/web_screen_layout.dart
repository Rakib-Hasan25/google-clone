import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:googleclone/utils/color.dart';
import 'package:googleclone/widgets/web/translation_buttons.dart';
import 'package:googleclone/widgets/web/web_buttons.dart';
import 'package:googleclone/widgets/web/web_footer.dart';
import 'package:googleclone/widgets/web/web_search.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: backgroundColor, actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    0.0), // Adjust the value for rectangular shape
              ),
              padding: const EdgeInsets.all(10.0), // Adjust padding as needed
            ),
            child: const Text(
              "Gmail",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              padding: const EdgeInsets.all(10.0),
            ),
            child: const Text(
              "Images",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
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
                borderRadius:
                    BorderRadius.circular(0.0), // Adjust the radius as needed
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
        body: Column(
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
                        WebButtons(),
                        SizedBox(
                          height: 5,
                        ),
                        TranslationButtons()
                      ],
                    ),
                    WebFooter()
                  ]),
            )
          ],
        ),
      ),
    );
  }
}


