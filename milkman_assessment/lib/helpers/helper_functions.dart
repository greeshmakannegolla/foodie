import 'package:milkman_assessment/data_mocks/restaurant_data.dart';

List<RestaurantMock> searchRestaurant(
    String text, List<RestaurantMock> restaurantList) {
  List<RestaurantMock> filteredList = [];
  text = text.toLowerCase().replaceAll(' ', '');
  for (var restaurant in restaurantList) {
    var _restaurantName = restaurant.name.toLowerCase().replaceAll(' ', '');

    if (_restaurantName.contains(text)) {
      filteredList.add(restaurant);
    }
  }
  return filteredList;
}
