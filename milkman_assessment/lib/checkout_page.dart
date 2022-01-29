import 'package:flutter/material.dart';
import 'package:milkman_assessment/helpers/color_constants.dart';
import 'package:milkman_assessment/helpers/string_constants.dart';
import 'package:milkman_assessment/helpers/style_constants.dart';
import 'package:milkman_assessment/helpers/increment_decrement_widget.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  late TextEditingController _promoController;

  @override
  void initState() {
    super.initState();
    _promoController = TextEditingController();
  }

  @override
  void dispose() {
    _promoController.dispose();

    super.dispose();
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
                floatingActionButton: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                      fixedSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width * 0.95, 55)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 3),
                    child: Text(
                      "MAKE PAYMENT", //TODO: Show total amount
                      style: kHeader.copyWith(
                        color: ColorConstants.appBackgroundColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          content: Text(
                            "Payment successful! Delicious food is on your way!",
                            style: kData,
                          )),
                    );
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                backgroundColor: ColorConstants.appBackgroundColor,
                appBar: AppBar(
                  elevation: 0,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.appBackgroundColor,
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
                        color: ColorConstants.textPrimaryColor,
                      ),
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        _getRestaurantDetailBanner(),
                        SizedBox(
                          height: 30,
                        ),
                        _getItemListTile(), //TODO: Has to be a ListView
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: ColorConstants.secondaryTextColor
                              .withOpacity(0.1),
                          thickness: 12,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/promo.png",
                                  height: 35,
                                  width: 35,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Apply Promo",
                                  style: kData,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextField(
                                controller: _promoController,
                                onChanged: (newText) {},
                                decoration: InputDecoration(
                                    suffix: InkWell(
                                      child: Text("APPLY", style: kData),
                                      onTap: () async {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        await showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              content: Text(
                                                "Yay, Promo code applied successfully!",
                                                style: kData,
                                              )),
                                        );
                                      },
                                    ),
                                    fillColor: Colors.black.withOpacity(0.05),
                                    filled: true,
                                    hintText: 'Enter promo code',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8))),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _promoController.clear();
                                    setState(() {});
                                  },
                                  child: Text(remove,
                                      style: TextStyle(
                                          color: ColorConstants
                                              .actionButtonColor)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Divider(
                              color: ColorConstants.secondaryTextColor
                                  .withOpacity(0.1),
                              thickness: 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _getDeliveryInfo(),
                        SizedBox(
                          height: 20,
                        ),
                        _getTipCard()
                      ],
                    ),
                  ),
                ))));
  }

  Column _getTipCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tipHeader,
          style: kData,
        ),
        SizedBox(
          height: 8,
        ),
        Text(tipContent,
            style: kData.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: ColorConstants.textPrimaryColor.withOpacity(0.6))),
        SizedBox(
          height: 25,
        ),
        Divider(
          color: ColorConstants.secondaryTextColor.withOpacity(0.1),
          thickness: 12,
        ),
      ],
    );
  }

  Column _getDeliveryInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.delivery_dining_rounded),
            SizedBox(
              width: 5,
            ),
            Text(
              deliveryHeader,
              style: kData,
            ),
            Spacer(),
            Text(change,
                style: TextStyle(color: ColorConstants.actionButtonColor))
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(deliveryContent,
            style: kData.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: ColorConstants.textPrimaryColor.withOpacity(0.6))),
        SizedBox(
          height: 30,
        ),
        Divider(
          color: ColorConstants.secondaryTextColor.withOpacity(0.1),
          thickness: 12,
        ),
      ],
    );
  }

  Row _getItemListTile() {
    return Row(
      children: [
        Image.asset(
          vegIcon,
          height: 25,
          width: 25,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "Veg Biryani",
          style: kData,
        ),
        Spacer(),
        IncrementDecrement(
          onChanged: (ba) {},
        ),
        Text(
          "₹300", //TODO:Need to increment counter
          style: kData,
        )
      ],
    );
  }

  Row _getRestaurantDetailBanner() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: Image.asset(
            food3,
            height: 65,
            width: 65,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: 18,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Paradise",
            style: kData,
          ),
          Text("Hyderabad",
              style: kSecondaryHeader.copyWith(
                  fontSize: 13,
                  color: ColorConstants.secondaryTextColor.withOpacity(0.6)))
        ])
      ],
    );
  }
}
