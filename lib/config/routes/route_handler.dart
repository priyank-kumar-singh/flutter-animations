part of 'routes.dart';

abstract class RouteHandler extends Routes {
  static Route<Widget> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return routeBuilder(const PageNotFoundScreen(), settings);
    }
  }

  static Route<Widget> routeBuilder(Widget route, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => route, settings: settings);
  }
}
