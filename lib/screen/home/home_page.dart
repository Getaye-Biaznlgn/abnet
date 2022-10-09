import 'package:abnet/utils/styles.dart';
import 'package:abnet/widget/drawer.dart';
import '../../model/db_helper.dart';
import 'package:flutter/material.dart';
import 'components/main_title_item.dart';
import '../../model/pray_category.dart';
import 'components/verse_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBHelper dbHelper = DBHelper();
  late Future _futureCategory;
  late List<PrayCategory> prayCategories;
  ScrollController controller = ScrollController();
  bool closeVerseBanner = false;
  initDB() async {
    return await dbHelper.getPrayCategories();
  }

  @override
  void initState() {
    super.initState();
    _futureCategory = initDB();
    controller.addListener(() {
      setState(() {
        closeVerseBanner = controller.offset > 50;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('የኔታ'),
          iconTheme: const IconThemeData(color: Colors.white),
  
        ),
        drawer: const DrawerWidget(),
        body: Column(
          children: <Widget>[
            ConditionalVerseBanner(
                closeVerseBanner: closeVerseBanner, size: size),
            Expanded(
              child: FutureBuilder(
                  future: _futureCategory,
                  builder: (context, dataSnapshot) {
                    if (dataSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (dataSnapshot.error != null) {
                        return const Center(
                          child: Text('Faild to load'),
                        );
                      } else {
                        prayCategories =
                            dataSnapshot.data as List<PrayCategory>;
                        return ListView.builder(
                          controller: controller,
                          itemCount: prayCategories.length,
                          // physics: const BouncingScrollPhysics(),
                          itemBuilder: (cxt, index) {
                            return MainTitleItem(
                                category: prayCategories[index]);
                          },
                        );
                      }
                    }
                  }),
            ),
          ],
        ));
  }
}


