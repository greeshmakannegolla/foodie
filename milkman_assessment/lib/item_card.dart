import 'package:flutter/material.dart';
import 'package:milkman_assessment/data_mocks/restaurant_data.dart';
import 'package:milkman_assessment/helpers/color_constants.dart';
import 'package:milkman_assessment/helpers/increment_decrement_widget.dart';
import 'package:milkman_assessment/helpers/style_constants.dart';
import 'package:milkman_assessment/models/cart_model.dart';
import 'package:milkman_assessment/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:flavor/flavor_theme.dart';
import 'package:flavor/flavor_assets.dart';

class ItemCard extends StatefulWidget {
  final MenuItemMock item;
  final int id;
  const ItemCard(this.item, this.id, {Key? key}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  late MenuItemMock _item;

  int _itemQuantity = 0;

  @override
  void initState() {
    super.initState();
    _item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    _itemQuantity =
        context.watch<CartProvider>().getCart.getItemQuantity(_item);

//UI of each item in the restaurant
    return Card(
      elevation: 0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _item.isVeg
                        ? Image.asset(
                            FlavorAssets.kVegIcon,
                            height: 20,
                            width: 25,
                          )
                        : Container(),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      _item.name,
                      style: kHeader.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "₹" + _item.price.toString(),
                      style: kHeader.copyWith(
                          fontSize: 16,
                          color: ColorConstants.kSecondaryTextColor
                              .withOpacity(0.9),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(_item.description,
                        style: kHeader.copyWith(
                            fontSize: 14,
                            color: ColorConstants.kSecondaryTextColor
                                .withOpacity(0.9),
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: Image.asset(
                      _item.imagePath,
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  (_itemQuantity == 0)
                      ? OutlinedButton(
                          onPressed: () {
                            context
                                .read<CartProvider>()
                                .updateCart(CartItem(_item, 1, widget.id));
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0))),
                          ),
                          child: Text(
                            "ADD",
                            style: kSecondaryHeader.copyWith(
                                color: FlavorTheme.kAppPrimaryColor,
                                fontSize: 20),
                          ))
                      : IncrementDecrement(
                          initialValue: _itemQuantity,
                          onChanged: _itemQuantityUpdated),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: ColorConstants.kSecondaryTextColor.withOpacity(0.3),
            thickness: 0.5,
          ),
        ],
      ),
    );
  }

  _itemQuantityUpdated(int newValue) {
    var cartProvider = context.read<CartProvider>();
    cartProvider.updateCart(CartItem(_item, newValue, widget.id));

    setState(() {});
  }
}
