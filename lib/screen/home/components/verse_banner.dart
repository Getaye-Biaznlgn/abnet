import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class ConditionalVerseBanner extends StatelessWidget {
  const ConditionalVerseBanner({
    Key? key,
    required this.closeVerseBanner,
    required this.size,
  }) : super(key: key);

  final bool closeVerseBanner;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !closeVerseBanner,
      child: Container(
        height: size.height * 0.15,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: kPrimaryLight,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
              children: const [Text('ኩሉ ወነጽሩ ወሰናይ ግበሩ'), Text('23')]),
        ),
      ),
    );
  }
}