import 'package:flutter/material.dart';
import 'package:milkman_assessment/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  final _cart = Cart();

  Cart get getCart => _cart;

  updateCart(CartItem item) {
    _cart.updateItem(item);

    notifyListeners();
  }
}
