import 'package:flutter/material.dart';
import 'package:implicit_animation/model/location_model.dart';
import 'package:implicit_animation/widget/detail_info_widget.dart';
import 'package:implicit_animation/widget/reviews_widget.dart';
import '../data/hero_tag.dart';
import '../widget/hero_widget.dart';
import '../widget/lat_long_widget.dart';

class DetailPage extends StatelessWidget {
  final Location location;
  final Animation<double> animation;

  const DetailPage({
    required this.location,
    required this.animation,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('INTERESTS', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: Navigator.of(context).pop,
            ),
            const SizedBox(width: 10),
          ],
          leading: const Icon(Icons.search_outlined, color: Colors.white),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox.expand(
                    child: HeroWidget(
                      tag: HeroTag.image(location.imageUrl),
                      child: Image.asset(location.imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: LatLongWidget(location: location),
                  ),
                ],
              ),
            ),
            DetailedInfoWidget(location: location),
            Expanded(
              flex: 5,
              child: ReviewsWidget(location: location, animation: animation),
            ),
          ],
        ),
      );
}
