import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorLoadingCardWidget extends StatelessWidget {
  final double width;
  final double height;
  final double? borderRadius;
  final bool? isDarkMode;
  const ErrorLoadingCardWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 12,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDarkMode!
          ? const Color.fromARGB(255, 26, 26, 26)
          : Colors.grey.shade100,
      width: width,
      height: height,
      child: const Center(
        child: FaIcon(FontAwesomeIcons.image),
      ),
    );
  }
}
