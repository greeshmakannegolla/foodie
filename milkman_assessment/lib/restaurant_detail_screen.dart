import 'package:flutter/material.dart';
import 'package:milkman_assessment/checkout_page.dart';
import 'package:milkman_assessment/data_mocks/restaurant_data.dart';
import 'package:milkman_assessment/helpers/color_constants.dart';
import 'package:milkman_assessment/helpers/style_constants.dart';
import 'package:milkman_assessment/item_card.dart';
import 'package:milkman_assessment/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:flavor/flavor_theme.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final RestaurantMock restaurantData;
  const RestaurantDetailScreen(this.restaurantData, {Key? key})
      : super(key: key);

  @override
  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  late RestaurantMock _restaurantData;
  @override
  void initState() {
    super.initState();
    _restaurantData = widget.restaurantData;
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
          backgroundColor: ColorConstants.kAppBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: ColorConstants.kAppBackgroundColor,
              ),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: ColorConstants.kTextPrimaryColor,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.favorite_border_rounded,
                  color: ColorConstants.kTextPrimaryColor,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.ios_share_rounded,
                  color: ColorConstants.kTextPrimaryColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_restaurantData.name,
                                style: kHeader.copyWith(fontSize: 25)),
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              child: Container(
                                color: ColorConstants.kRatingColor,
                                height: 35,
                                width: 55,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 3),
                                  child: Row(children: [
                                    Text(
                                      _restaurantData.rating.toString(),
                                      style: kSecondaryHeader.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: ColorConstants
                                              .kAppBackgroundColor),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      size: 12,
                                      color: ColorConstants.kAppBackgroundColor,
                                    )
                                  ]),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(_restaurantData.cuisine,
                            style: kSecondaryHeader.copyWith(
                                color: ColorConstants.kTextPrimaryColor
                                    .withOpacity(0.9))),
                        SizedBox(
                          height: 7,
                        ),
                        Text(_restaurantData.address,
                            style: kSecondaryHeader.copyWith(
                                color: ColorConstants.kSecondaryTextColor
                                    .withOpacity(0.8))),
                        SizedBox(
                          height: 18,
                        ),
                        Divider(
                          color: ColorConstants.kSecondaryTextColor
                              .withOpacity(0.3),
                          thickness: 0.5,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        //List of items available in the restaurant
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: _restaurantData.items.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 12),
                              child: ItemCard(
                                _restaurantData.items[index],
                                _restaurantData.id,
                                key: UniqueKey(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
          floatingActionButton: TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(FlavorTheme.kButtonPrimaryColor),
                fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.95, 55)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                )),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.shopping_cart_rounded,
                    color: ColorConstants.kAppBackgroundColor,
                  ),
                  Text(
                    "Proceed with"
                    " ${context.watch<CartProvider>().getCart.getCartTotalQuantity()}"
                    " items",
                    style: kHeader.copyWith(
                        color: ColorConstants.kAppBackgroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: ColorConstants.kAppBackgroundColor,
                  ),
                ],
              ),
            ),
            onPressed: () async {
              //Navigation to checkout page
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CheckOut(_restaurantData)),
              );
              setState(() {});
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        )));
  }
}
