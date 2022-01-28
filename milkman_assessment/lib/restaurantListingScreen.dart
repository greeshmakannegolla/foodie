// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:milkman_assessment/helpers/colorConstants.dart';
import 'package:milkman_assessment/restaurantCard.dart';
import 'package:milkman_assessment/restaurantDetailScreen.dart';

class RestaurantListingScreen extends StatefulWidget {
  const RestaurantListingScreen({Key? key}) : super(key: key);

  @override
  _RestaurantListingScreenState createState() =>
      _RestaurantListingScreenState();
}

class _RestaurantListingScreenState extends State<RestaurantListingScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 80,
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: TextField(
                          onChanged: (newText) {},
                          decoration: InputDecoration(
                              fillColor: Colors.black.withOpacity(0.05),
                              filled: true,
                              prefixIcon: Icon(Icons.search_rounded),
                              hintText: 'Search Restaurants',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.zero))),
                  Wrap(
                    spacing: 6.0,
                    runSpacing: 0,
                    children: <Widget>[
                      _buildChip('MAX Safety'),
                      _buildChip('Rating:4+'),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RestaurantDetailScreen()),
                      );
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          child: RestaurantCard(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildChip(String label) {
  return Chip(
    label: Text(
      label,
      style: TextStyle(
        color: ColorConstants.textPrimaryColor,
      ),
    ),
    backgroundColor: ColorConstants.appBackgroundColor,
    elevation: 1,
    shadowColor: Colors.grey[60],
    padding: EdgeInsets.all(8.0),
  );
}
