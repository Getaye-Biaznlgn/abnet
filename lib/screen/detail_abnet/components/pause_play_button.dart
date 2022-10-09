
import 'package:flutter/material.dart';
import '../../../page_manager.dart';

class PausePlayButton extends StatelessWidget {
  const PausePlayButton({
    Key? key,
    required PageManager pageManager,
  }) : _pageManager = pageManager, super(key: key);

  final PageManager _pageManager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ButtonState>(
                valueListenable: _pageManager.buttonNotifier,
                builder: (_, value, __) {
    switch (value) {
      case ButtonState.loading:
        return Container(
          margin: const EdgeInsets.all(8.0),
          width: 32.0,
          height: 32.0,
          child:  CircularProgressIndicator( color: Theme.of(context).primaryColor,),
        );
      case ButtonState.paused:
        return IconButton(
          icon: Icon(Icons.play_arrow, color: Theme.of(context).primaryColor,),
          iconSize: 32.0,
          onPressed: () {
            _pageManager.play();
          },
        );
      case ButtonState.playing:
        return IconButton(
          icon: Icon(Icons.pause,color: Theme.of(context).primaryColor,),
          iconSize: 32.0,
          onPressed: () {
            _pageManager.pause();
          },
        );
    }
   },
 );
   }
}
