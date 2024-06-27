import 'package:flutter/material.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/feactures/animal/domain/entities/entities.dart';

class InfoDetailAnimalWidget extends StatelessWidget {
  final Animal detailAnimal;
  final bool? isDarkMode;

  const InfoDetailAnimalWidget({
    super.key,
    required this.detailAnimal,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: colorBottomNavegation(isDarkMode!),
        boxShadow: [
          BoxShadow(
            color: isDarkMode!
                ? Colors.white.withOpacity(0.08)
                : Colors.black.withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: isDarkMode! ? 0 : 15,
            offset: Offset(0, isDarkMode! ? -1.5 : -13),
          ),
        ],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
          bottom: Radius.zero,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _nameAndRaza(size, isDarkMode!),
          _infoBasePets(size, isDarkMode!),
          SizedBox(height: size.height * 0.015),
          _vacunateContainer(size, Colors.red, isDarkMode!),
          SizedBox(height: size.height * 0.018),
          _ubicationInfo(size, isDarkMode!),
          _sobrePets(size, isDarkMode!)
        ],
      ),
    );
  }

  Widget _nameAndRaza(Size size, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.025),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(detailAnimal.name, style: titleNamePetsDetailPets(isDarkMode)),
        ),
        SizedBox(height: size.height * 0.005),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(detailAnimal.race, style: titlerazaDetailPets(isDarkMode)),
        ),
        SizedBox(height: size.height * 0.015),
      ],
    );
  }

  Widget _infoBasePets(Size size, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _containerInfo(size, colorSexo(isDarkMode), detailAnimal.sexo, 'Sexo', isDarkMode),
        _containerInfo(size, colorEdad(isDarkMode), '${detailAnimal.age} Años','Edad', isDarkMode),
        _containerInfo(size, colorPeso(isDarkMode),'${detailAnimal.weight} Kilos', 'Peso', isDarkMode),
      ],
    );
  }

  Widget _containerInfo(
      Size size, Color color, String title, String subTitle, bool isDarkMode) {
    return SizedBox(
      width: size.width * 0.3,
      height: size.height * 0.07,
      child: Row(
        children: [
          _barLine(size, color),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.003),
                Text(title, style: titleGeneroDetailPets(isDarkMode)),
                Text(subTitle, style: titleSexoDetailPets(isDarkMode)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _barLine(Size size, Color color) {
    return Container(
      width: size.width * 0.018,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)),
    );
  }

  Widget _vacunateContainer(Size size, Color color, bool isDarkMode) {
    final vacunado = detailAnimal.vacunate;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: vacunado ? size.width * 0.35 : size.width * 0.41,
        height: size.height * 0.038,
        decoration: BoxDecoration( color: vacunado ? colorVacunado(isDarkMode) : Colors.red,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(vacunado ? 'Vacuando' : 'No Vacuando', style: titleVacunaDetailPets(vacunado)),
            SizedBox(width: size.width * 0.02),
            Icon(vacunado ? Icons.check_rounded : Icons.cancel_outlined,
                size: size.height * 0.025,
                color: vacunado ? Colors.black54 : Colors.white)
          ],
        ),
      ),
    );
  }

  Widget _ubicationInfo(Size size, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: size.width * 0.06),
        Container(
          width: size.height * 0.045,
          height: size.height * 0.045,
          decoration: BoxDecoration(color: colorLocationFondo(isDarkMode), shape: BoxShape.circle),
          child: Icon(
            Icons.location_on_sharp,
            size: size.height * 0.03,
            color: colorLocation(isDarkMode),
          ),
        ),
        SizedBox(width: size.width * 0.02),
        Text(detailAnimal.address, style: titleLocationDetailPets(isDarkMode))
      ],
    );
  }

  Widget _sobrePets(Size size, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.018),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Sobre ${detailAnimal.name}', style: titleSobrePetsDetailPets(isDarkMode)),
        ),
        SizedBox(height: size.height * 0.005),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            height: size.height * 0.09,
            child: Text(
              maxLines: 3,
              detailAnimal.description,
              style: subTitleSobreDetailPets(isDarkMode),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.015),
      ],
    );
  }
}
