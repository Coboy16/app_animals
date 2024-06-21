import 'package:flutter/material.dart';

class WelcomeImageWidget extends StatelessWidget {
  final String assetsImage;
  final bool isDarkMode;
  const WelcomeImageWidget({
    super.key,
    required this.assetsImage,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //Base de la imagen
    final container = Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: size.width,
        height: size.height * 0.4,
        decoration: BoxDecoration(
          color: isDarkMode
              ? const Color.fromARGB(121, 255, 95, 95)
              : const Color(0xfffeeff2),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(90),
            bottomRight: Radius.circular(90),
            topLeft: Radius.circular(190),
            topRight: Radius.circular(190),
          ),
        ),
      ),
    );

    return SizedBox(
      height: size.height * 0.52,
      width: size.width,
      child: Stack(
        children: [
          Align(alignment: Alignment.bottomCenter, child: container),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SizedBox(
                height: size.height * 0.56,
                child: Image.asset(assetsImage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
