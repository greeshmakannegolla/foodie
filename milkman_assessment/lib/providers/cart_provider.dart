import 'package:flutter/material.dart';
import 'package:milkman_assessment/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  final _cart = Cart();
  var cartRestaurantId = 0;

  Cart get getCart => _cart;

//Function to update cart and notify listeners
  updateCart(CartItem item) {
    if (cartRestaurantId != item.restaurantId) {
      _cart.clear();
    }

    cartRestaurantId = item.restaurantId;
    _cart.updateItem(item);
    notifyListeners();
  }
}
