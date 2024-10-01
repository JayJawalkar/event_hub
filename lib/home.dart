import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String location = "Pune,Hadapsar";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  size: 30,
                  Icons.stacked_bar_chart_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        title: Center(
          child: Column(
            children: [
              const Text(
                "Current Location",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                location,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      "Event Genere",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: cards("Debate", Colors.red[400] as Color)),
                      cards("Music", Colors.orange[400] as Color),
                      cards("Sports", Colors.green[400] as Color),
                      cards("Comedy", Colors.yellow[400] as Color),
                      cards("Coding", Colors.blue[400] as Color),
                      cards("E-Sports", Colors.teal[400] as Color),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(18),
                child: const Text(
                  "Suggested",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Stack(
                children: [
                  SvgPicture.asset(
                    "assets/code.jpg",
                    fit: BoxFit.cover,
                  ),
                ],
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          btmNavIt(const Icon(Icons.home), "Home"),
          btmNavIt(const Icon(Icons.search_rounded), "Search"),
          btmNavIt(const Icon(CupertinoIcons.heart), "Favourites"),
          btmNavIt(const Icon(Icons.person), "Profile"),
        ],
        elevation: 1,
      ),
    );
  }

  Card cards(String text, Color colors) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: colors, // Border color
          width: 2, // Border width
        ),
      ),
      margin: const EdgeInsets.all(12),
      elevation: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  NavigationDestination btmNavIt(Icon icon, String label) =>
      NavigationDestination(
        icon: icon,
        label: label,
      );
}
