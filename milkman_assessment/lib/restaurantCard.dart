// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:milkman_assessment/helpers/colorConstants.dart';
import 'package:milkman_assessment/helpers/styleConstants.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({Key? key}) : super(key: key);

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 15.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: SizedBox(
                height: 230,
                width: double.infinity,
                child: Image.asset(
                    "images/food1.jpeg"), //TODO:Get each restaurant's name
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 5.5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Paradise",
                      style: kHeader,
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Container(
                        color: ColorConstants.ratingColor,
                        height: 25,
                        width: 45,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3),
                          child: Row(children: [
                            Text(
                              "3.5",
                              style: kSecondaryHeader.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.5,
                                  color: ColorConstants.appBackgroundColor),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Icons.star_rounded,
                              size: 12,
                              color: ColorConstants.appBackgroundColor,
                            )
                          ]),
                        ),
                      ),
                    )
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("South Indian, Chinese", style: kSecondaryHeader),
                Text("₹300 for one", style: kSecondaryHeader)
              ],
            ),
            SizedBox(
              height: 5.5,
            ),
            Text("Closes in 25 mins",
                style: kSecondaryHeader.copyWith(
                    color: ColorConstants.appPrimaryColor)),
          ],
        ),
      ),
    );
  }
}
