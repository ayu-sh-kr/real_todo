
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  const ButtonComponent({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
            color: text != 'Save' ? Colors.red : Colors.yellow[800],
            child: Text(text, style: const TextStyle(color: Colors.white),),
    );
  }
}
