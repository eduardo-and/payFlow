import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;
  const LabelButton(
      {Key? key, required this.label, required this.onPressed, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 56,
      child: TextButton(
        onPressed: () {},
        child: Text(
          label,
          style: this.style ?? AppTextStyles.buttonHeading,
        ),
      ),
    );
  }
}
