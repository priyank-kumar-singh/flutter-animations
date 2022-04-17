part of 'routes.dart';

abstract class RouteConfig {
  static final routes = <String, Widget Function(BuildContext)>{
    Routes.root: (_) => const HomePage(),
    
    Routes.infiniteLoop: (_) => const InfiniteLoopAnim(),
  };
}
