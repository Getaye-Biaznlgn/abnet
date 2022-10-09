import 'package:abnet/utils/styles.dart';
import 'package:flutter/material.dart';
import '../../model/pray_category.dart';
import 'components/sub_item.dart';

class SubItemPage extends StatelessWidget {
  final PrayCategory? category;
  const SubItemPage({required this.category, Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
    onPressed: () => Navigator.of(context).pop(),
  ),
         title: Text(category!.name, style: const TextStyle(color: kPrimaryLight),)
         
         ),
      body: ListView.builder(
                        itemCount: category!.prays.length,
                        itemBuilder: (cxt, index) {
                          return SubItem(
                              pray: category!.prays[index]);
                        },
    )
    );
  }
}
