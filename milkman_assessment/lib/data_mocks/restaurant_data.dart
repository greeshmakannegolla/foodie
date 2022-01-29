import 'package:milkman_assessment/helpers/string_constants.dart';

class RestaurantMock {
  String get name => _name;

  final String _name;
  final String cuisine;
  final num rating;
  final num priceForOne;
  final String closingTime;
  final bool maxSafety;
  final String imagePath;
  final List<MenuItemMock> items;
  final String address;

  RestaurantMock(
      this._name,
      this.cuisine,
      this.rating,
      this.priceForOne,
      this.closingTime,
      this.maxSafety,
      this.imagePath,
      this.items,
      this.address);
}

class MenuItemMock {
  final String name;
  final num price;
  final String description;
  final String imagePath;
  final bool isVeg;

  //Cons
  MenuItemMock(
      this.name, this.price, this.description, this.imagePath, this.isVeg);
}

List<RestaurantMock> getRestaurantList() {
  return [
    RestaurantMock(
        'Paradise',
        'South Indian, Chinese',
        3.5,
        300,
        "Closes in 25 mins",
        true,
        food2,
        [
          MenuItemMock(
              "Veg Biryani",
              309,
              "Made with indian spices, fresh veggies and lots of love",
              food2,
              true),
          MenuItemMock("Veg Thali", 700,
              "Thali comprising rice, roti, curry and sweet", food3, true),
          MenuItemMock(
              "Chicken Biryani",
              429,
              "Made with indian spices, chicken and lots of love",
              food2,
              false),
          MenuItemMock("Cheese Loaded Burger", 99,
              "Loaded with veggies and cheese", food7, true),
        ],
        "Plot 49, Survey 261 to 266, Hyderabad"),
    RestaurantMock(
        "Cake L'amore",
        "Desserts, Bakery",
        4.0,
        200,
        "Closes in 30 mins",
        true,
        food9,
        [
          MenuItemMock("Pancakes", 200, "Get lost in the chocolate goeeyness",
              food9, false),
          MenuItemMock("Cheese Loaded Burger", 99,
              "Loaded with veggies and cheese", food7, true),
        ],
        "200 Ramkrishna Nagar Bldg th Road Khar"),
    RestaurantMock(
        "Karachi Bakery",
        "Bakery, Pizzas",
        4.4,
        400,
        "Closes in 46 mins",
        true,
        food7,
        [
          MenuItemMock("Veggie Loaded Burger", 99,
              "Loaded with veggies and cheese", food7, true),
          MenuItemMock("Mixed Veg Curry", 399,
              "With the goodness of vegetables", food5, true),
          MenuItemMock("Chole Bhatura", 199,
              "2 bhature served with spicy chole curry", food1, true),
        ],
        "Plot No. 310 B (First Floor), Road No - 25, Venkatagiri, Jubilee Hills"),
    RestaurantMock(
        "Little Italy",
        "Vegan, Healthy",
        4.6,
        600,
        "Closes in 59 mins",
        true,
        food10,
        [
          MenuItemMock(
              "Vegan delight", 299, "Made with tofu, tempeh", food10, true),
          MenuItemMock(
              "Stir-fried veggies", 399, "Loaded with veggies", food8, true),
        ],
        "Softsol Tower-1 2nd floor A Wing, Infocity, Software Units Layout, Madhapur"),
    RestaurantMock(
        "Dhaba House",
        'North Indian, Chinese',
        2.4,
        150,
        "Closes in 20 mins",
        false,
        food3,
        [
          MenuItemMock("Chicken Curry", 399, "With the goodness of spices",
              food5, false),
          MenuItemMock("Fish fry", 299, "Spicy treat", food8, false),
        ],
        "P-187, R R District, S Lin Pally")
  ];
}
