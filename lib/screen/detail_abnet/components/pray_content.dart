import 'package:flutter/material.dart';
import '../../../utils/styles.dart';
import '../detail_page.dart';

class PrayContent extends StatelessWidget {
  const PrayContent({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: SingleChildScrollView(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(widget.pray.content?? "", style: kNormalTextStyle,),
    )));
  }
}