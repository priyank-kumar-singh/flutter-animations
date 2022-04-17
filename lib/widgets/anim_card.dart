import 'package:flutter/material.dart';

import '../models/models.dart';
import 'tap_detector.dart';

class AnimCard extends StatelessWidget {
  final AnimCardItem item;
  final VoidCallback onTap;

  const AnimCard(
    this.item, {
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TapDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4.0),
                ),
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Text(
                  //   item.description,
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
