import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimCardItem {
  final String name;
  final String image;
  final String description;
  final Widget widget;

  AnimCardItem({
    required this.name,
    required this.image,
    required this.description,
    required this.widget,
  });
}

class AnimCard extends StatelessWidget {
  final AnimCardItem item;
  final double heightFactor;

  const AnimCard(
    this.item, {
    Key? key,
    this.heightFactor = 0.25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return item.widget;
        }));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12.0),
              ),
              child: Image.asset(
                'images/${item.image}',
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * heightFactor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
