import 'package:animate_do/animate_do.dart';
import 'package:dog_app/feactures/animal/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final bool isDarkMode;
  const SearchWidget({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Expanded(
        child: FadeInRight(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: colorSearch(isDarkMode),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.search, color: Colors.grey),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar mascota',
                        border: InputBorder.none,
                        hintStyle: searchMascota(isDarkMode),
                        labelStyle: searchMascota(isDarkMode),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
