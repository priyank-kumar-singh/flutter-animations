import 'package:flutter/material.dart';
import 'package:flutter_animations/themes/theme.dart';
import 'package:flutter_animations/widgets/switch.dart';
import 'package:google_fonts/google_fonts.dart';

import 'anim_card.dart';
import 'infinity_loop_anim/anim.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<AnimCardItem> items = [
    AnimCardItem(
        name: 'Infinite Loop',
        image: 'infinite_loop.jpg',
        description: '',
        widget: const InfinityLoopAnim()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 12.0,
                  ),
                  Flexible(
                    child: Text(
                      'Flutter Animations',
                      style: GoogleFonts.dancingScript().copyWith(
                        fontSize: 44.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SwitchButton.icon(
                    value: currentAppTheme.isDark,
                    toggle: (val) {
                      currentAppTheme.switchTheme();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) => AnimCard(items[0]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
