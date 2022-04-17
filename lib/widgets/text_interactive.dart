import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A class representing a text item of InteractiveText with certain associative
/// properties.
///
/// This will behave as a normal text if [onTap] is null, but still you can override
/// [style] property of [InteractiveText].
class InteractiveTextItem {
  /// String to be displayed as a text
  final String text;

  /// GestureCallback which triggers in response to a tap event on the text
  final GestureTapCallback? onTap;

  /// This [style] property will override [style] and [interactiveTextStyle]
  /// properties of [InteractiveText]
  final TextStyle? style;

  InteractiveTextItem(
    this.text, {
    this.style,
    this.onTap,
  });
}

/// The [InteractiveText] widget displays text that uses multiple different styles.
/// The text to display is described using a list of [InteractiveTextItem] objects,
/// each of which has an associated style and a onTap property.
///
/// The text might break across multiple lines or might all be displayed on the
/// same line depending on the layout constraints.
///
/// This widget is an extension to the [RichText] widget.
class InteractiveText extends RichText {
  /// Creates a list of TextSpan items with different associative properties.
  ///
  /// If [interactiveTextStyle] and [style] properties of respective TextItem are
  /// null then style property will be used for interactive text with a blue color
  /// of shade500.
  /// #### Check below code
  /// ```dart
  /// textStyle = interactiveTextStyle ?? style?.copyWith(
  ///   color: interactiveTextColor ?? const Color.fromARGB(255, 33, 150, 243),
  /// ) ?? TextStyle(
  ///   color: interactiveTextColor ?? const Color.fromARGB(255, 33, 150, 243),
  ///   fontSize: 14.0,
  /// );
  /// ```
  InteractiveText({
    Key? key,
    required List<InteractiveTextItem> text,
    TextStyle? style,
    TextStyle? interactiveTextStyle,
    Color? textColor,
    Color? interactiveTextColor,
    int? maxLines,
    Locale? locale,
    bool softWrap = true,
    StrutStyle? strutStyle,
    double textScaleFactor = 1.0,
    TextAlign textAlign = TextAlign.start,
    TextDirection? textDirection,
    TextHeightBehavior? textHeightBehavior,
    TextOverflow overflow = TextOverflow.clip,
    TextWidthBasis textWidthBasis = TextWidthBasis.parent,
  }) : super(
          key: key,
          text: TextSpan(
            children: text.map((e) {
              final isInteractive = e.onTap != null;
              late final TextStyle? textStyle;
              if (e.style != null) {
                textStyle = e.style!;
              } else if (isInteractive) {
                textStyle = interactiveTextStyle ?? style?.copyWith(
                  color: interactiveTextColor ?? const Color.fromARGB(255, 33, 150, 243),
                ) ?? TextStyle(
                  color: interactiveTextColor ?? const Color.fromARGB(255, 33, 150, 243),
                  fontSize: 14.0,
                );
              } else {
                textStyle = style ?? TextStyle(
                  color: textColor ?? const Color.fromARGB(255, 33, 33, 33),
                  fontSize: 14.0,
                );
              }
              return TextSpan(
                text: e.text,
                style: textStyle,
                recognizer: TapGestureRecognizer()..onTap = e.onTap,
                mouseCursor: isInteractive ? SystemMouseCursors.click : MouseCursor.defer,
              );
            }).toList(),
          ),
          locale: locale,
          maxLines: maxLines,
          overflow: overflow,
          softWrap: softWrap,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          textHeightBehavior: textHeightBehavior,
          textScaleFactor: textScaleFactor,
          textWidthBasis: textWidthBasis,
        );
}
