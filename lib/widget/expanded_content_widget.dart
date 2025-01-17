import 'package:flutter/material.dart';
import 'package:implicit_animation/data/hero_tag.dart';
import 'package:implicit_animation/data/locations_data.dart';
import 'package:implicit_animation/model/location_model.dart';
import 'package:implicit_animation/widget/hero_widget.dart';
import 'package:implicit_animation/widget/stars_widget.dart';

class ExpandedContentWidget extends StatelessWidget {
  final Location location;

  const ExpandedContentWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            HeroWidget(tag: HeroTag.addressLine1(location), child: Text(location.addressLine1)),
            const SizedBox(height: 5),
            _buildAddressRating(location: location),
            const SizedBox(height: 12),
            _buildReview(location: location)
          ],
        ),
      );
  Widget _buildAddressRating({required Location location}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeroWidget(
              tag: HeroTag.addressLine2(location),
              child: Text(
                location.addressLine2,
                style: const TextStyle(color: Colors.black45),
              )),
          HeroWidget(tag: HeroTag.stars(location), child: StarsWidget(stars: location.starRating)),
        ],
      );

  Widget _buildReview({required Location location}) => Row(
        children: location.reviews.map(
          (review) {
            final pageIndex = locations.indexOf(location);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: HeroWidget(
                  tag: HeroTag.avatar(review, pageIndex),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage(review.imageUrl),
                  )),
            );
          },
        ).toList(),
      );
}
