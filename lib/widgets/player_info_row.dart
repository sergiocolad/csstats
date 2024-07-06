import 'package:flutter/material.dart';
import 'custom_text.dart';

class PlayerInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const PlayerInfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: '$label: ',
          fontWeight: FontWeight.bold,
        ),
        CustomText(text: value),
      ],
    );
  }
}
