import 'package:flutter/material.dart';
import 'package:implicit_animation/model/location_model.dart';
import 'package:implicit_animation/page/detail_page.dart';
import 'package:implicit_animation/widget/expanded_content_widget.dart';
import 'package:implicit_animation/widget/image_widget.dart';

class LocationWidget extends StatefulWidget {
  final Location location;
  const LocationWidget({super.key, required this.location});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
   bool _isExpanded = false;
  void _openDetailPage() {
    if (!_isExpanded) {
      setState(() =>_isExpanded = true);
      return;
    }

    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.5),
          );

          return FadeTransition(
            opacity: curvedAnimation,
            child: DetailPage(location: widget.location, animation: animation),
          );
        },
      ),
    );
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        _isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        _isExpanded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: _isExpanded ? 40 : 100,
          width: _isExpanded ? size.width * 0.8 : size.width * 0.70,
          height: _isExpanded ? size.height * 0.6 : size.height * 0.5,
          child: ExpandedContentWidget(location: widget.location),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: _isExpanded ? 150 : 100,
          child: GestureDetector(
            onPanUpdate: _onPanUpdate,
            onTap:_openDetailPage,
            child: ImageWidget(location: widget.location),
          ),
        ),
      ],
    );
  }
}
