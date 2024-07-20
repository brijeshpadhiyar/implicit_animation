import 'package:flutter/material.dart';
import 'package:implicit_animation/data/locations_data.dart';
import 'package:implicit_animation/widget/location_widget.dart';

class LocationsWidget extends StatefulWidget {
  const LocationsWidget({super.key});

  @override
  State<LocationsWidget> createState() => _LocationsWidgetState();
}

class _LocationsWidgetState extends State<LocationsWidget> {
  final _pageController = PageController(viewportFraction: 0.8);
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
              child: PageView.builder(
            controller: _pageController,
            itemCount: locations.length,
            onPageChanged: (index) => setState(() {
              _pageIndex = index;
            }),
            itemBuilder: (context, index) {
              final location = locations[index];
              return LocationWidget(
                location: location,
              );
            },
          )),
          Text(
            "${_pageIndex + 1}/${locations.length}",
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      );
}
