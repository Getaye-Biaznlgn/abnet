import 'package:flutter/material.dart';
import '../../../model/pray_item.dart';
import '../../detail_abnet/detail_page.dart';
import '../../../utils/styles.dart';

class SubItem extends StatelessWidget {
  const SubItem({required this.pray, Key? key}) : super(key: key);
  final PrayItem pray;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                        pray: pray,
                      )));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Row(
            children: [
              Text(pray.title ?? "", style: kListItemTextStyle),
              const Spacer(),
              const ClipOval(
                child: Material(
                  color: Colors.red, // Button color
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.volume_up,
                        size: 20,
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
