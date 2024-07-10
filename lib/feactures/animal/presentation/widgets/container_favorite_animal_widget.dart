import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';
import '/shared/presentation/blocs/theme_bloc/theme_bloc.dart';

class ContainerFavoriteAnimalWidget extends StatelessWidget {
  final String image;
  final String name;
  final String raza;
  final String sexo;
  final String edad;
  final String ide;
  final bool? colorSexo;

  const ContainerFavoriteAnimalWidget({
    super.key,
    required this.image,
    required this.name,
    required this.raza,
    required this.sexo,
    required this.edad,
    required this.ide,
    this.colorSexo,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final favoriteBloc = BlocProvider.of<FavoritePetsBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Container(
            width: size.width,
            height: size.height * 0.17,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 4,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: _imagePets(size, state.isDarkMode)),
                SizedBox(width: size.width * 0.03),
                SizedBox(
                  width: size.width * 0.54,
                  height: size.height * 0.13,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.011),
                          Text(name, style: titlePetsFavorite()),
                          Text(raza, style: razaAnimalFavorite()),
                          SizedBox(height: size.height * 0.012),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _tagAnimal(sexo, Colors.blueAccent, true),
                              SizedBox(width: size.width * 0.02),
                              _tagAnimal(edad, Colors.grey, false),
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const FaIcon(
                          FontAwesomeIcons.solidHeart,
                          size: 21,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _imagePets(Size size, bool isDarkMode) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: size.width * 0.28,
        height: size.height * 0.13,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, progress) => LoadingWidget(
            width: size.width * 0.28,
            height: size.height * 0.13,
            isDarkMode: isDarkMode,
          ),
          errorListener: (value) => ErrorLoadingCardWidget(
            width: size.width * 0.28,
            height: size.height * 0.13,
            isDarkMode: isDarkMode,
          ),
        ),
      ),
    );
  }

  Widget _tagAnimal(String text, Color color, bool age) {
    return Container(
      decoration: BoxDecoration(
          color: age
              ? !colorSexo!
                  ? color
                  : const Color(0xffff3063)
              : color,
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Text(text, style: tagAnimalFavorite()),
    );
  }
}
