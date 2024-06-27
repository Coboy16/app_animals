import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:photo_view/photo_view.dart';

import '/feactures/animal/presentation/resources/resources.dart';
import '/shared/presentation/blocs/theme_bloc/theme_bloc.dart';


class GalleryPhotoScreen extends StatefulWidget {
  final List<String> galleryItems;
  final int initialIndex;

  const GalleryPhotoScreen(
      {super.key, required this.galleryItems, this.initialIndex = 0});

  @override
  State<GalleryPhotoScreen> createState() => _GalleryPhotoScreenState();
}

class _GalleryPhotoScreenState extends State<GalleryPhotoScreen> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  void onPageChanged(int index) => setState(() => currentIndex = index);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorBase(state.isDarkMode),
          appBar: _appBar(context, size, state.isDarkMode),
          body: Padding(
            padding:  EdgeInsets.only(bottom: size.height * 0.1),
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: CachedNetworkImageProvider(widget.galleryItems[index]),
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2,
                  heroAttributes: PhotoViewHeroAttributes(tag: widget.galleryItems[index]),
                  filterQuality: FilterQuality.high,
                );
              },
              itemCount: widget.galleryItems.length,
              loadingBuilder: (context, event) => SizedBox(
                  width: size.height * 0.035,
                  height: size.height * 0.035,
                  child: CircularProgressIndicator(color: colorBase(state.isDarkMode))),
              backgroundDecoration: BoxDecoration(color: colorBase(state.isDarkMode)),
              pageController: PageController(initialPage: widget.initialIndex),
              onPageChanged: onPageChanged,
            ),
          ),
        );
      },
    );
  }

  _appBar(BuildContext context, Size size, bool isDarkMode) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: colorBase(isDarkMode),
      backgroundColor: colorBase(isDarkMode),
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: FadeInLeft(
          duration: const Duration(milliseconds: 300),
          child: const Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
