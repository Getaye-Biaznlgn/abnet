import 'package:flutter/material.dart';

import '../../utils/styles.dart';
import '../wudasie_pray_page.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.categories,
    required this.index
  }) : super(key: key);

  final List<Map<String, dynamic>> categories;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => WudasiePrayPage(
                      prayCategoryId: categories[index]['id'],
                      categoryName: categories[index]['name'],
                    )));
      },
      child:  Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
          child: Text(categories[index]['name'] ?? "", style: kListItemTextStyle),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
        ))
    ;
  }
}
