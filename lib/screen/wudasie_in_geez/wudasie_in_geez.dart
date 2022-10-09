import 'package:flutter/material.dart';
import '../../model/db_helper.dart';
import '../../utils/styles.dart';
import '../wudasie_pray_page.dart';
import 'list_item.dart';

class WudasieInGeez extends StatefulWidget {
  const WudasieInGeez({Key? key}) : super(key: key);

  @override
  State<WudasieInGeez> createState() => _WudasieInGeezState();
}

class _WudasieInGeezState extends State<WudasieInGeez> {
  late Future _futureCategories;
  DBHelper dbHelper = DBHelper();
  late List<Map<String, dynamic>> categories;
  ScrollController controller = ScrollController();
  @override
  void initState() {
    _futureCategories = setCategories();
    super.initState();
  }

  setCategories() async {
    return await dbHelper.getCategories();
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
        title: const Text(
          'ውዳሴ ማርያም በልሳነ ግእዝ',
          style: TextStyle(color: kPrimaryLight),
        ),
      ),
      body: FutureBuilder(
          future: _futureCategories,
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
                    return ListItem(categories: categories, index: index);
                  },
                );
              }
            }
          }),
    );
  }
}


