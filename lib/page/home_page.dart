import 'package:flutter/material.dart';
import 'package:implicit_animation/widget/locations_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue,
        appBar: _buildAppBar(),
        body: const LocationsWidget(),
        bottomNavigationBar: _buildBottomNavigation(),
      );

  AppBar _buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "INTERESTS",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_pin,
                color: Colors.white,
              )),
        ],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.white,
            )),
      );
  Widget _buildBottomNavigation() => BottomNavigationBar(
          elevation: 0,
          unselectedItemColor: Colors.white54,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.pin_drop_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.add_location), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
          ]);
}
