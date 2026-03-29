import 'dart:ui';

import 'package:flutter/material.dart';

class PlayWithWidget extends StatefulWidget {
  const PlayWithWidget({super.key});

  @override
  State<PlayWithWidget> createState() => _PlayWithWidgetState();
}

class _PlayWithWidgetState extends State<PlayWithWidget> {
  double sliderCount = .5;
  double secondSliderCount = .4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              initialItemCount: 100,
              shrinkWrap: true,
              itemBuilder: (context, index, _) {
                return ListTile(
                  
                  title: Text('data'),
                  leading: Icon(Icons.phone),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
