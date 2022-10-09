import 'package:flutter/material.dart';
import '../../sub_item/sub_item_page.dart';
import '../../../model/pray_category.dart';
import '../../../utils/styles.dart';

class MainTitleItem extends StatelessWidget {
  const MainTitleItem({required this.category, Key? key}) : super(key: key);
  final PrayCategory category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SubItemPage(
                        category: category,
                      )));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
          child: Row(
            children: [
              Text(category.name, style: kListItemTextStyle),
              const Spacer(),
              const ClipOval(
                child: Material(
                  color: Colors.red, // Button color
                  child: SizedBox(
                      width: 21,
                      height: 21,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
        ));
  }
}
