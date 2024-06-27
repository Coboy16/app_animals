import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/shared/presentation/blocs/theme_bloc/theme_bloc.dart';
import '/feactures/animal/presentation/screens/screens.dart';
import '/feactures/animal/presentation/widgets/widgets.dart';

class CarouselImageDetailWidget extends StatelessWidget {
  final List<String> listPhotos;
  const CarouselImageDetailWidget({super.key, required this.listPhotos});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
         final List<Widget> imageSliders = listPhotos
            .asMap()
            .entries
            .map(
              (entry) => GestureDetector(
                onTap: () => _movePage(context, entry.key),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: SizedBox(
                    width: size.width,
                    child: CachedNetworkImage(
                      imageUrl: entry.value,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress) => LoadingWidget(
                        width: size.width,
                        height: size.height * 0.3,
                        borderRadius: 16,
                        isDarkMode: state.isDarkMode,
                      ),
                      errorWidget: (context, url, error) => ErrorLoadingCardWidget(
                        width: size.width * 0.43,
                        height: size.height * 0.26,
                        borderRadius: 16,
                        isDarkMode: state.isDarkMode,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList();

      
        return Container(
          width: size.width,
          height: size.height * 0.34,
          color: colorTopDetailAnimal(state.isDarkMode),
          child: CarouselSlider(
            options: CarouselOptions(
              height: size.height * 0.3,
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        );
      },
    );
  }

  void _movePage(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryPhotoScreen(galleryItems: listPhotos, initialIndex: index ),
      ),
    );
  }
}
