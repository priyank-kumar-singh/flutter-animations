import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/animations.dart';

import '../../views/views.dart';

part 'route_config.dart';
part 'route_handler.dart';

abstract class Routes {
  static const root = '/';
  static const from404 = '/';

  static const infiniteLoop = '/animation/infinite_loop';
}
