import 'package:flutter/material.dart';

import '/feactures/animal/presentation/widgets/widgets.dart';
import '/feactures/animal/domain/entities/entities.dart';

class CenterWidgetsViewAnimal extends StatelessWidget {
  final Animal animalRight;
  final Animal? animalLeft;
  final void Function()? onTapRight;
  final void Function()? onTapLeft;

  const CenterWidgetsViewAnimal({
    super.key,
    required this.animalRight,
    this.animalLeft,
    this.onTapRight,
    this.onTapLeft,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: size.width * 0.01),
        //Todo: -> Animal izquierda
        Padding(
          padding: const EdgeInsets.only(bottom: 23),
          child: GestureDetector(
            onTap: onTapRight,
            child: _animalTem(animalRight, size),
          ),
        ),
        SizedBox(width: size.width * 0.01),
        //Todo: -> Animal derecha
        Padding(
          padding: const EdgeInsets.only(top: 23),
          child: GestureDetector(
            onTap: onTapLeft,
            child: _animalTem(animalLeft!, size),
          ),
        ),
        SizedBox(width: size.width * 0.01),
      ],
    );
  }

  Widget _animalTem(Animal animal, Size size) {
    return AnimalCardWidget(
      urlImage: animal.profilePhoto,
      name: animal.name,
      race: animal.race,
      id: animal.id,
      type: animal.type,
    );
  }
}
