import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  final String title;
  const FooterText({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(color: Color.fromARGB(115, 108, 102, 102)),);
  }
}
