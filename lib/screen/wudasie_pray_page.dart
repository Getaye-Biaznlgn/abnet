import 'package:flutter/material.dart';

import '../model/db_helper.dart';
import '../utils/styles.dart';

class WudasiePrayPage extends StatefulWidget {
  int prayCategoryId;
  String categoryName;
  WudasiePrayPage({required this.prayCategoryId, required this.categoryName, Key? key}) : super(key: key);

  @override
  State<WudasiePrayPage> createState() => _WudasiePrayPageState();
}

class _WudasiePrayPageState extends State<WudasiePrayPage> {
  late Future _futurePray;
  DBHelper dbHelper = DBHelper();
  late List<Map<String, dynamic>> categories;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    _futurePray = setPray();
    super.initState();
  }

  setPray() async {
    return await dbHelper.getPreyInGeez(widget.prayCategoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.categoryName,
          style: const TextStyle(color: kPrimaryLight),
        ),
      ),
      body: FutureBuilder(
          future: _futurePray,
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (dataSnapshot.error != null) {
                return const Center(
                  child: Text('Faild to load'),
                );
              } else {
                categories = dataSnapshot.data as List<Map<String, dynamic>>;
                return ListView.builder(
                  controller: controller,
                  itemCount: categories.length,
                  // physics: const BouncingScrollPhysics(),
                  itemBuilder: (cxt, index) {
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12.0),
                        child: Text(categories[index]['content'] ?? "",
                            style: kNormalTextStyle));
                  },
                );
              }
            }
          }),
    );
  }
}
