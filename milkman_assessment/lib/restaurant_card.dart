// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:milkman_assessment/data_mocks/restaurant_data.dart';
import 'package:milkman_assessment/helpers/color_constants.dart';
import 'package:milkman_assessment/helpers/style_constants.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard(this.restaurantData, {Key? key}) : super(key: key);

  final RestaurantMock restaurantData;

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  late RestaurantMock _restaurantData;

  @override
  void initState() {
    super.initState();
    _restaurantData = widget.restaurantData;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 15.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            child: SizedBox(
              height: 230,
              width: double.infinity,
              child: Image.asset(_restaurantData.imagePath, fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
            child: _getRestaurantInfo(),
          ),
        ],
      ),
    );
  }

  Column _getRestaurantInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 5.5),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              _restaurantData.name,
              style: kHeader,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Container(
                color: ColorConstants.ratingColor,
                height: 25,
                width: 45,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3),
                  child: Row(children: [
                    Text(
                      _restaurantData.rating.toString(),
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
          children: [
            Text(_restaurantData.cuisine, style: kSecondaryHeader),
            Text("₹${_restaurantData.priceForOne} for one",
                style: kSecondaryHeader)
          ],
        ),
        SizedBox(
          height: 5.5,
        ),
        Text(_restaurantData.closingTime,
            style: kSecondaryHeader.copyWith(
                color: ColorConstants.appPrimaryColor)),
        SizedBox(
          height: 5.5,
        ),
      ],
    );
  }
}
