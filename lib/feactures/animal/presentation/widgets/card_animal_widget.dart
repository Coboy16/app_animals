import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';
import '/feactures/animal/domain/entities/entities.dart';
import '/feactures/animal/presentation/blocs/blocs.dart';
import '/shared/presentation/blocs/blocs.dart';

class AnimalCardWidget extends StatefulWidget {
  final String urlImage;
  final String name;
  final String race;
  final String id;
  final String type;
  final double? borderRadius;

  const AnimalCardWidget({
    super.key,
    required this.urlImage,
    required this.name,
    required this.race,
    required this.id,
    required this.type,
    this.borderRadius = 16,
  });

  @override
  State<AnimalCardWidget> createState() => _AnimalCardWidgetState();
}

class _AnimalCardWidgetState extends State<AnimalCardWidget> {
  late FavoritesAnimalsBloc _favoritesAnimalsBloc;
  @override
  void initState() {
    _favoritesAnimalsBloc = BlocProvider.of<FavoritesAnimalsBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _imageAnimalCard(size, state.isDarkMode),
              _bottomInfoImage(size),
            ],
          ),
        );
      },
    );
  }

  Widget _imageAnimalCard(Size size, bool isDarkMode) {
    return SizedBox(
      width: size.width * 0.43,
      height: size.height * 0.26,
      child: CachedNetworkImage(
        imageUrl: widget.urlImage,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) => LoadingWidget(
          width: size.width * 0.43,
          height: size.height * 0.26,
          borderRadius: widget.borderRadius,
          isDarkMode: isDarkMode,
        ),
        errorListener: (value) => ErrorLoadingCardWidget(
          width: size.width * 0.43,
          height: size.height * 0.26,
          isDarkMode: isDarkMode,
        ),
      ),
    );
  }

  Widget _bottomInfoImage(Size size) {
    return SizedBox(
      width: size.width * 0.43,
      height: size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name, style: nameAnimalContainerWidget()),
                SizedBox(
                  width: size.width * 0.3,
                  child: Text(
                    widget.race,
                    overflow: TextOverflow.ellipsis,
                    style: razaAnimalContainerWidget(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 5),
            child: GestureDetector(
              onTap: () {
                //Guardar animal como favorito
                _favoritesAnimalsBloc.toogleFavorite(Animal(
                    id: widget.id,
                    name: widget.name,
                    race: widget.race,
                    profilePhoto: widget.urlImage,
                    type: widget.type));
                setState(() {});
              },
              child: FutureBuilder<bool>(
                future: _favoritesAnimalsBloc.isVerifidFavorite(widget.id),
                builder: (context, snapshot) {
                  final isFavorite = snapshot.data ?? false;
                  return FaIcon(
                    isFavorite
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                    size: 28,
                    color: Colors.white,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
