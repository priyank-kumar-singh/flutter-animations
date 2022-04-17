import 'package:flutter/material.dart';

import '../config/config.dart';
import '../constants/const.dart';
import '../util/util.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                    width: 4.0,
                  ),
                  Flexible(
                    child: Text(
                      'Flutter Animations',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return SwitchButton.icon(
                        value: appTheme.isDark,
                        toggle: (val) {
                          appTheme.switchTheme();
                          setState(() {});
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ResponsiveLayoutBuilder(
                small: (_, child) => child!,
                medium: (_, child) => child!,
                large: (_, child) => child!,
                child: (size) {
                  late final int crossAxisCount;
                  late final double aspectRatio;
                  if (size == LayoutSize.small) {
                    crossAxisCount = 1;
                    aspectRatio = 16 / 11;
                  } else if (size == LayoutSize.medium) {
                    crossAxisCount = 3;
                    aspectRatio = 5 / 4;
                  } else {
                    crossAxisCount = 4;
                    aspectRatio = 16 / 11;
                  }

                  return GridView.count(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: aspectRatio,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    padding: const EdgeInsets.all(16.0),
                    children: Animations.items.map((e) {
                      return AnimCard(e, onTap: () {
                        Navigator.of(context).pushNamed(e.route);
                      });
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.share),
        onPressed: () {
          showShareDialog(context);
        },
      ),
    );
  }
}
