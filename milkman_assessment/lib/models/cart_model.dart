import 'package:milkman_assessment/data_mocks/restaurant_data.dart';

class Cart {
  List<CartItem> cartItems = [];

  num getCartTotal() {
    return cartItems.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.menuItem.price * element.quantity));
  }

  int getCartTotalQuantity() {
    return cartItems.fold(
        0, (previousValue, element) => previousValue + element.quantity);
  }

  clear() {
    cartItems.clear();
  }

  updateItem(CartItem item) {
    if (cartItems.contains(item)) {
      var index = cartItems.indexOf(item);

      if (item.quantity == 0) {
        cartItems.removeAt(index);
      } else {
        cartItems[index].quantity = item.quantity;
      }
    } else {
      if (item.quantity > 0) {
        cartItems.add(item);
      }
    }
  }

  int getItemQuantity(MenuItemMock menuItem) {
    var items =
        cartItems.where((element) => element.menuItem.id == menuItem.id);
    if (items.isEmpty) {
      return 0;
    } else {
      return items.toList()[0].quantity;
    }
  }
}

class CartItem {
  MenuItemMock menuItem;
  int quantity;
  int restaurantId;

  //Overriding to specify the condition to be checked upon during menu item comparison
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is CartItem && other.menuItem.id == menuItem.id;
  }

  @override
  int get hashCode => menuItem.id.hashCode;

  CartItem(this.menuItem, this.quantity, this.restaurantId);
}
