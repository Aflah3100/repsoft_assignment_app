
import 'package:flutter/material.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({
    super.key,
    required this.label,
    required this.labelStyle,
  });
  final String label;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
          color: const Color(0xffE6FFE8),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            label,
            style: labelStyle,
          ),
        ],
      ),
    );
  }
}
