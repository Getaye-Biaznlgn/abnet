import 'package:flutter/material.dart';
import '../../model/pray_item.dart';
import '../../page_manager.dart';
import '../../utils/styles.dart';
import 'components/pause_play_button.dart';
import 'components/player_progress.dart';
import 'components/pray_content.dart';
class DetailPage extends StatefulWidget {
  final PrayItem pray;
   const DetailPage({required this.pray});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late PageManager _pageManager;
  @override
  void initState() {
    super.initState();
    _pageManager = PageManager(voiceFile: widget.pray.voicePath?? 'zezewotir/02abunezebesemayat.mp3');
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
        body: Column(
          children: [
            PrayContent(widget: widget),
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  PlayerProgress(pageManager: _pageManager),
                  PausePlayButton(pageManager: _pageManager),
                ],
              ),
            ),
          ],
        ));
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
),

       title: Text(widget.pray.title?? "", style: const TextStyle(
         color: kPrimaryLight
       ),),
       );
  }
}


