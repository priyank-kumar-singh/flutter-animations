import 'package:flutter/material.dart';

import '../constants/assets/path.dart';
import '../util/util.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton(
    this.iconData, {
    Key? key,
    this.url,
    this.mini = false,
    this.constrainMinWidth = true,
    this.constrainedWidth = 64.0,
    this.iconBorderRadius = 4.0,
    this.iconSize = 24.0,
    this.margin = const EdgeInsets.all(8.0),
    this.onTap,
    this.textStyle,
  }) : super(key: key);

  final SocialMediaIcons iconData;
  final String? url;
  final bool mini;
  final bool constrainMinWidth;
  final double constrainedWidth;
  final double iconSize;
  final EdgeInsets margin;
  final double iconBorderRadius;
  final TextStyle? textStyle;
  final GestureTapCallback? onTap;

  static String getIconName(SocialMediaIcons iconData) {
    switch (iconData) {
      case SocialMediaIcons.facebook:
        return 'Facebook';
      case SocialMediaIcons.github:
        return 'GitHub';
      case SocialMediaIcons.instagram:
        return 'Instagram';
      case SocialMediaIcons.linkedIn:
        return 'LinkedIn';
      case SocialMediaIcons.medium:
        return 'Medium';
      case SocialMediaIcons.twitter:
        return 'Twitter';
      case SocialMediaIcons.youtube:
        return 'YouTube';
      default:
        return 'Link';
    }
  }

  @override
  Widget build(BuildContext context) {
    String icon = getIconName(iconData);
    return Padding(
      padding: mini ? EdgeInsets.zero : margin,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(
            color: mini ? Colors.transparent : Colors.grey,
          )),
          padding: MaterialStateProperty.all(const EdgeInsets.all(16.0)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48.0),
          )),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: iconSize,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(iconBorderRadius),
                ),
                child: Visibility(
                  visible: icon != 'Link',
                  child: Image(
                    image: AssetImage(
                      AssetPath.icons + icon.toLowerCase() + '.png',
                    ),
                  ),
                  replacement: const Icon(Icons.link),
                ),
              ),
            ),
            Visibility(
              visible: !mini,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constrainMinWidth ? constrainedWidth : 0.0,
                  ),
                  child: Text(
                    icon,
                    style: textStyle ??
                        const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
        onPressed: onTap ?? (url == null ? null : () async => await URLHelper.open(url!)),
        onHover: (val) {
          if (val) {
            // Scaffold.maybeOf(context).
          }
        },
      ),
    );
  }
}

enum SocialMediaIcons {
  facebook,
  instagram,
  github,
  linkedIn,
  medium,
  twitter,
  youtube,
  link,
}
