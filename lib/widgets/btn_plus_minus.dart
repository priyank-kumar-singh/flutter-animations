import 'package:flutter/material.dart';

class ButtonPlusMinus extends StatelessWidget {
  const ButtonPlusMinus({
    Key? key,
    required this.isPlus,
    required this.onTap,
  }) : super(key: key);

  final bool isPlus;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox.square(
        dimension: 36.0,
        child: MaterialButton(
          color: isPlus ? Colors.green : Colors.red,
          shape: const CircleBorder(),
          child: Center(
            child: Icon(
              isPlus ? Icons.add_rounded : Icons.remove_rounded,
              color: Colors.white,
              size: 20.0,
            ),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
