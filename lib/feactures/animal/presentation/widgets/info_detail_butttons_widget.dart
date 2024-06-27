import 'package:flutter/material.dart';

import '/feactures/animal/presentation/resources/resources.dart';

class InfoDetailButttonsWidget extends StatelessWidget {
  final String name;
  final bool isDarkMode;

  const InfoDetailButttonsWidget({
    super.key,
    required this.name,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: colorBottomNavegation(isDarkMode),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: size.width * 0.26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bubleIcon(size, Icons.phone),
                _bubleIcon(size, Icons.message),
              ],
            ),
          ),
          Container(
            width: size.width * 0.53,
            height: size.height * 0.055,
            decoration: BoxDecoration(
                color: const Color(0xfffa6e68),
                borderRadius: BorderRadius.circular(24)),
            child: Center(
                child: Text('Adopta $name', style: titleBtnAdoptDetailPets())),
          ),
        ],
      ),
    );
  }

  Widget _bubleIcon(Size size, IconData icon) {
    return Container(
      width: size.height * 0.055,
      height: size.height * 0.055,
      decoration: BoxDecoration(
          color: colorBubleFondo(isDarkMode), shape: BoxShape.circle),
      child: Icon(
        icon,
        size: size.height * 0.03,
        color: colorBubleIcon(isDarkMode),
      ),
    );
  }
}
