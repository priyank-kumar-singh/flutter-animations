import '../config/config.dart';
import '../models/models.dart';
import 'assets/assets.gen.dart';

abstract class Animations {
  static final items = <AnimCardItem>[
    AnimCardItem(
      title: 'Infinite Loop',
      description: '',
      route: Routes.infiniteLoop,
      image: Assets.images.infiniteLoop.path,
    ),
  ];
}
