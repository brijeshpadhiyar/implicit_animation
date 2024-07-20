import 'package:flutter/material.dart';
import 'package:implicit_animation/model/location_model.dart';
import 'package:implicit_animation/widget/hero_widget.dart';
import 'package:implicit_animation/widget/lat_long_widget.dart';

import '../data/hero_tag.dart';

class ImageWidget extends StatelessWidget {
  final Location location;

  const ImageWidget({required this.location, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      /// space from white container
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.5,
      width: size.width * 0.8,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            buildImage(),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTopText(),
                  LatLongWidget(location: location),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() => SizedBox.expand(
        child: HeroWidget(
          tag: HeroTag.image(location.imageUrl),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.asset(location.imageUrl, fit: BoxFit.cover),
          ),
        ),
      );

  Widget buildTopText() => Text(
        location.name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      );
}
