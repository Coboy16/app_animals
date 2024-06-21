import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  final double? borderRadius;
  final bool? isDarkMode;

  const LoadingWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 12,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: _efectLoading(),
    );
  }

  Widget _efectLoading() {
    return Shimmer.fromColors(
      baseColor: isDarkMode!
          ? const Color.fromARGB(255, 26, 26, 26)
          : Colors.grey.shade100,
      highlightColor: isDarkMode! ? Colors.grey.shade800 : Colors.grey.shade300,
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode! ? const Color(0xff222222) : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      ),
    );
  }
}
