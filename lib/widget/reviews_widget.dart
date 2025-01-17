import 'package:flutter/material.dart';
import 'package:implicit_animation/data/locations_data.dart';
import 'package:implicit_animation/model/location_model.dart';
import 'package:implicit_animation/model/review_model.dart';

import '../data/hero_tag.dart';
import 'hero_widget.dart';

class ReviewsWidget extends StatelessWidget {
  final Location location;
  final Animation<double> animation;

  const ReviewsWidget({
    required this.location,
    required this.animation,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: location.reviews.length,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final review = location.reviews[index];

          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) => FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: const Interval(0.2, 1, curve: Curves.easeInExpo),
              ),
              child: child,
            ),
            child: buildReview(review),
          );
        },
      );

  Widget buildReview(Review review) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeroWidget(
                  tag: HeroTag.avatar(review, locations.indexOf(location)),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage(review.imageUrl),
                  ),
                ),
                Text(
                  review.username,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(),
                Text(
                  review.date,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const Icon(Icons.thumb_up_alt_outlined, size: 14)
              ],
            ),
            const SizedBox(height: 8),
            Text(
              review.description,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
}
