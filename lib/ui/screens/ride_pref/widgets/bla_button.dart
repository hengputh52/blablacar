import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final Color textColor;
  final Color backgroundColorButton;

  BlaButton.primary({required this.label, this.icon})
    : textColor = BlaColors.white,
      backgroundColorButton = BlaColors.primary;

  BlaButton.secondary({required this.label, this.icon})
    : textColor = BlaColors.primary,
      backgroundColorButton = BlaColors.white;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColorButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BlaSpacings.radius),
        
        ),
        padding: const EdgeInsets.symmetric(
          vertical: BlaSpacings.m,
          horizontal: BlaSpacings.l
        )
      ),
      onPressed: () => {},
      child: icon == null
          ? Text(label, style: BlaTextStyles.button.copyWith(color: textColor))
          : Row(
              children: [
                Icon(icon, color: textColor, size: 18),
                Text(
                  label,
                  style: BlaTextStyles.button.copyWith(color: textColor),
                ),
              ],
            ),
    );
  }
}
