import 'package:flutter/material.dart';

import '/feactures/animal/presentation/resources/resources.dart';

class BottomShowModalWidget extends StatelessWidget {
  final String title;
  final String text;
  final bool isDarkMode;
  
  const BottomShowModalWidget({
    super.key,
    required this.title,
    required this.text,
    required this.isDarkMode
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: Container(
        color: colorBottomNavegation(isDarkMode),
        width: size.width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: titleSobrePetsDetailPets(isDarkMode),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                textAlign: TextAlign.justify,
                style: subTitleSobreDetailPets(isDarkMode),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      ),
    );
  }
}
