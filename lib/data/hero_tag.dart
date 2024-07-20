

import 'package:implicit_animation/model/location_model.dart';

import '../model/review_model.dart';

class HeroTag {
  static String image(String imageUrl) => imageUrl;

  static String addressLine1(Location location) =>
      location.name + location.addressLine1;

  static String addressLine2(Location location) =>
      location.name + location.addressLine2;

  static String stars(Location location) =>
      location.name + location.starRating.toString();

  static String avatar(Review review, int position) =>
      review.imageUrl + position.toString();
}
