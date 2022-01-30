import 'package:flutter/material.dart';
import 'package:milkman_assessment/data_mocks/restaurant_data.dart';
import 'package:milkman_assessment/helpers/color_constants.dart';
import 'package:milkman_assessment/helpers/string_constants.dart';
import 'package:milkman_assessment/helpers/style_constants.dart';
import 'package:milkman_assessment/helpers/increment_decrement_widget.dart';
import 'package:milkman_assessment/models/cart_model.dart';
import 'package:milkman_assessment/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  final RestaurantMock restaurantData;
  const CheckOut(this.restaurantData, {Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  late TextEditingController _promoController;
  late RestaurantMock _restaurantData;
  bool _isPromoApplied = false;

  @override
  void initState() {
    super.initState();
    _promoController = TextEditingController();
    _restaurantData = widget.restaurantData;
  }

  @override
  void dispose() {
    _promoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartProvider>().getCart;

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹" "${cart.getCartTotal()}",
                          style: kHeader.copyWith(
                            color: ColorConstants.appBackgroundColor,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          (cart.getCartTotal() == 0) ? "" : "MAKE PAYMENT",
                          style: kHeader.copyWith(
                            color: ColorConstants.appBackgroundColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () async {
                    (cart.getCartTotal() > 0)
                        ? await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                content: Text(
                                  "Payment successful! Delicious food is on your way!",
                                  style: kData,
                                )),
                          )
                        : null;
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
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: cart.cartItems.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: _getItemListTile(
                                  cart.cartItems[index], context),
                            );
                          },
                        ),
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
                                  kPromoIcon,
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
                                onChanged: (newText) {
                                  if (_promoController.text.isEmpty) {
                                    _isPromoApplied = false;
                                    setState(() {});
                                  }
                                },
                                decoration: InputDecoration(
                                    suffix: InkWell(
                                      child: _isPromoApplied
                                          ? Icon(
                                              Icons.check_circle_rounded,
                                              color: Colors.green,
                                            )
                                          : Text("APPLY", style: kData),
                                      onTap: () async {
                                        _isPromoApplied = true;
                                        setState(() {});
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
                            (_isPromoApplied &&
                                    _promoController.text.isNotEmpty)
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              _promoController.clear();
                                              _isPromoApplied = false;
                                              setState(() {});
                                            },
                                            child: Text(kRemove,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .actionButtonColor)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Container(),
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
          kTipHeader,
          style: kData,
        ),
        SizedBox(
          height: 8,
        ),
        Text(kTipContent,
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
              kDeliveryHeader,
              style: kData,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(kDeliveryContent,
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

  Row _getItemListTile(CartItem item, BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            kVegIcon,
            height: 25,
            width: 25,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          flex: 2,
          child: Text(
            item.menuItem.name,
            style: kData,
          ),
        ),
        Expanded(
          flex: 2,
          child: IncrementDecrement(
            initialValue: item.quantity,
            onChanged: (newValue) {
              item.quantity = newValue;
              context.read<CartProvider>().updateCart(item);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "₹" "${item.menuItem.price * item.quantity}",
            style: kData,
          ),
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
            _restaurantData.imagePath,
            height: 65,
            width: 65,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _restaurantData.name,
                  style: kData,
                ),
                Text(_restaurantData.address,
                    style: kSecondaryHeader.copyWith(
                        fontSize: 13,
                        color:
                            ColorConstants.secondaryTextColor.withOpacity(0.6)))
              ]),
        )
      ],
    );
  }
}
