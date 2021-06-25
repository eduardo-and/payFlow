import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;

  const SetLabelButtons({ Key? key,required this.primaryLabel,required this.primaryOnPressed,required this.secondaryLabel, required this.secondaryOnPressed, this.enablePrimaryColor=false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: LabelButton(
                label: primaryLabel,
                onPressed: primaryOnPressed,
                style: enablePrimaryColor? AppTextStyles.buttonBoldPrimary:null
              ),
            ),
            DividerVertivalWidget(),
            Expanded(
              child: LabelButton(
                label: secondaryLabel,
                onPressed: secondaryOnPressed,
              ),
            ),
          ],
        ),
      );
  }
}