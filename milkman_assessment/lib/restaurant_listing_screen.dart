// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:milkman_assessment/data_mocks/restaurant_data.dart';
import 'package:milkman_assessment/helpers/color_constants.dart';
import 'package:milkman_assessment/helpers/helper_functions.dart';
import 'package:milkman_assessment/helpers/string_constants.dart';
import 'package:milkman_assessment/helpers/style_constants.dart';
import 'package:milkman_assessment/restaurant_card.dart';
import 'package:milkman_assessment/restaurant_detail_screen.dart';

class RestaurantListingScreen extends StatefulWidget {
  const RestaurantListingScreen({Key? key}) : super(key: key);

  @override
  _RestaurantListingScreenState createState() =>
      _RestaurantListingScreenState();
}

class _RestaurantListingScreenState extends State<RestaurantListingScreen> {
  List<RestaurantMock> _restaurantList = [];
  List<RestaurantMock> _filteredRestaurantList = [];

  final TextEditingController _searchController = TextEditingController();

  bool _maxSafety = false;
  bool _ratingFilter = false;

  @override
  void initState() {
    super.initState();
    _restaurantList = getRestaurantList();
    _filteredRestaurantList.addAll(_restaurantList);
  }

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
          appBar: AppBar(
            elevation: 0,
            title: Row(
              children: const [
                Icon(Icons.home_rounded),
                SizedBox(width: 5),
                Text("Home"),
              ],
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: ColorConstants.appPrimaryColor,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Restaurant search
                  Container(
                      height: 80,
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: TextField(
                          controller: _searchController,
                          cursorColor: ColorConstants.appPrimaryColor,
                          onChanged: (newText) {
                            _applyFilters();
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.black.withOpacity(0.05),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: ColorConstants.appPrimaryColor,
                              ),
                              hintText: kSearchRestaurants,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.zero))),
                  Wrap(
                    spacing: 6.0,
                    runSpacing: 0,
                    children: <Widget>[
                      _buildChip(kMaxSafety),
                      _buildChip(kRatingFilter),
                    ],
                  ),
                  _filteredRestaurantList.isEmpty
                      ? Center(
                          child: Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            'No Results found',
                            style: kData,
                          ),
                        ))
                      :
                      //To fetch restaurants
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: _filteredRestaurantList.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 12),
                              child: InkWell(
                                  onTap: () {
                                    //Navigation to the selected restaurant
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RestaurantDetailScreen(
                                                  _filteredRestaurantList[
                                                      index])),
                                    );
                                  },
                                  child: RestaurantCard(
                                    _filteredRestaurantList[index],
                                    key: UniqueKey(),
                                  )),
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//Function to apply search; max safety and rating filters
  void _applyFilters() {
    _filteredRestaurantList.clear();
    _filteredRestaurantList.addAll(_restaurantList);

    if (_searchController.text.isNotEmpty) {
      _filteredRestaurantList.clear();
      _filteredRestaurantList +=
          searchRestaurant(_searchController.text, _restaurantList);
    }

    if (_maxSafety) {
      var temp = _filteredRestaurantList.where((element) {
        return element.maxSafety;
      }).toList();

      _filteredRestaurantList.clear();
      _filteredRestaurantList += temp;
    }

    if (_ratingFilter) {
      var temp = _filteredRestaurantList.where((element) {
        return element.rating >= 4;
      }).toList();
      _filteredRestaurantList.clear();
      _filteredRestaurantList += temp;
    }

    setState(() {});
  }

  //To build the UI for filters
  Widget _buildChip(String label) {
    return InkWell(
      onTap: () {
        if (label == kMaxSafety) {
          _maxSafety = !_maxSafety;
        }
        if (label == kRatingFilter) {
          _ratingFilter = !_ratingFilter;
        }
        _applyFilters();
      },
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: (label == kMaxSafety && _maxSafety) ||
                    (label == kRatingFilter && _ratingFilter)
                ? ColorConstants.appBackgroundColor
                : ColorConstants.textPrimaryColor,
          ),
        ),
        backgroundColor: (label == kMaxSafety && _maxSafety) ||
                (label == kRatingFilter && _ratingFilter)
            ? ColorConstants.appPrimaryColor
            : ColorConstants.appBackgroundColor,
        elevation: 1,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
}
