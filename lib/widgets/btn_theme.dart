import 'package:flutter/material.dart';

import '../config/config.dart';
import 'tap_detector.dart';

class SwitchThemeIconButton extends StatefulWidget {
  const SwitchThemeIconButton({
    Key? key,
    this.toolTip = 'Switch Theme',
  }) : super(key: key);

  final String toolTip;

  @override
  State<SwitchThemeIconButton> createState() => _SwitchThemeIconButtonState();
}

class _SwitchThemeIconButtonState extends State<SwitchThemeIconButton> {
  @override
  Widget build(BuildContext context) {
    return TapDetector(
      child: Tooltip(
        message: widget.toolTip,
        child: Icon(
          appTheme.isDark
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined,
        ),
      ),
      onTap: () {
        appTheme.switchTheme();
        setState(() {});
      },
    );
  }
}
