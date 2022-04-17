import 'package:flutter/widgets.dart';

/// Represents the layout size passed to [ResponsiveLayoutBuilder.child].
enum LayoutSize {
  /// Small layout
  small,

  /// Medium layout
  medium,

  /// Large layout
  large
}

/// Breakpoints for different screen layouts
abstract class Breakpoints {
  static const small = 576;
  static const medium = 1200;
  static const large = 1440;
}

/// Signature for the individual builders (`small`, `medium`, `large`).
typedef ResponsiveLayoutWidgetBuilder = Widget Function(BuildContext, Widget?);

/// {@template responsive_layout_builder}
/// A wrapper around [LayoutBuilder] which exposes builders for
/// various responsive breakpoints.
/// {@endtemplate}
class ResponsiveLayoutBuilder extends StatelessWidget {
  /// {@macro responsive_layout_builder}
  const ResponsiveLayoutBuilder({
    Key? key,
    required this.small,
    required this.medium,
    required this.large,
    this.child,
  }) : super(key: key);

  /// [ResponsiveLayoutWidgetBuilder] for small layout.
  final ResponsiveLayoutWidgetBuilder small;

  /// [ResponsiveLayoutWidgetBuilder] for medium layout.
  final ResponsiveLayoutWidgetBuilder medium;

  /// [ResponsiveLayoutWidgetBuilder] for large layout.
  final ResponsiveLayoutWidgetBuilder large;

  /// Optional child widget builder based on the current layout size
  /// which will be passed to the `small`, `medium` and `large` builders
  /// as a way to share/optimize shared layout.
  final Widget Function(LayoutSize currentSize)? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;

        if (screenWidth <= Breakpoints.small) {
          return small(context, child?.call(LayoutSize.small));
        }
        if (screenWidth <= Breakpoints.medium) {
          return medium(context, child?.call(LayoutSize.medium));
        }
        if (screenWidth <= Breakpoints.large) {
          return large(context, child?.call(LayoutSize.large));
        }

        return large(context, child?.call(LayoutSize.large));
      },
    );
  }
}
