
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import '../../../page_manager.dart';

class PlayerProgress extends StatelessWidget {
  const PlayerProgress({
    Key? key,
    required PageManager pageManager,
  }) : _pageManager = pageManager, super(key: key);

  final PageManager _pageManager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: _pageManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: _pageManager.seek,
        );
      },
    );
  }
}
