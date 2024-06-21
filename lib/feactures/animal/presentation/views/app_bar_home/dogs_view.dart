import 'package:flutter/material.dart';

class DogsView extends StatelessWidget {
  const DogsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [],
    );
  }

  Widget _rowTwoAnimals() {
    return Row(
      children: [],
    );
  }

  Widget _animalTem(Size size) {
    return Container(
      width: size.width * 0.42,
      height: size.height * 0.26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.red,
      ),
    );
  }
}
