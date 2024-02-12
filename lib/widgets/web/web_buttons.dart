import 'package:flutter/material.dart';
import 'package:googleclone/utils/color.dart';

class WebButtons extends StatelessWidget {
  const WebButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () {},
            color: searchColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  0.0), // Adjust the radius as needed
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Google Search",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () {},
            color: searchColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  0.0), // Adjust the radius as needed
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "I'm Feeling Lucky",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}