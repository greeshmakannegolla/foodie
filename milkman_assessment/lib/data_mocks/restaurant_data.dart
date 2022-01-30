import 'package:milkman_assessment/helpers/string_constants.dart';

class RestaurantMock {
  String get name => _name;

  final int id;
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
      this.id,
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
  final int id;
  final String name;
  final num price;
  final String description;
  final String imagePath;
  final bool isVeg;

  MenuItemMock(this.id, this.name, this.price, this.description, this.imagePath,
      this.isVeg);
}

//Mock data
List<RestaurantMock> getRestaurantList() {
  return [
    RestaurantMock(
        111,
        'Paradise',
        'South Indian, Chinese',
        3.5,
        300,
        "Closes in 25 mins",
        true,
        kFood2,
        [
          MenuItemMock(
              1,
              "Veg Biryani",
              309,
              "Made with indian spices, fresh veggies and lots of love",
              kFood2,
              true),
          MenuItemMock(2, "Veg Thali", 700,
              "Thali comprising rice, roti, curry and sweet", kFood3, true),
          MenuItemMock(
              3,
              "Chicken Biryani",
              429,
              "Made with indian spices, chicken and lots of love",
              kFood2,
              false),
          MenuItemMock(4, "Cheese Loaded Burger", 99,
              "Loaded with veggies and cheese", kFood7, true),
        ],
        "Plot 49, Survey 261 to 266, Hyderabad"),
    RestaurantMock(
        112,
        "Cake L'amore",
        "Desserts, Bakery",
        4.0,
        200,
        "Closes in 30 mins",
        true,
        kFood9,
        [
          MenuItemMock(5, "Pancakes", 200,
              "Get lost in the chocolate goeeyness", kFood9, false),
          MenuItemMock(6, "Cheese Loaded Burger", 99,
              "Loaded with veggies and cheese", kFood7, true),
        ],
        "200 Ramkrishna Nagar Bldg th Road Khar"),
    RestaurantMock(
        113,
        "Karachi Bakery",
        "Bakery, Pizzas",
        4.4,
        400,
        "Closes in 46 mins",
        true,
        kFood7,
        [
          MenuItemMock(7, "Veggie Loaded Burger", 99,
              "Loaded with veggies and cheese", kFood7, true),
          MenuItemMock(8, "Mixed Veg Curry", 399,
              "With the goodness of vegetables", kFood5, true),
          MenuItemMock(9, "Chole Bhatura", 199,
              "2 bhature served with spicy chole curry", kFood1, true),
        ],
        "Plot No. 310 B (First Floor), Road No - 25, Venkatagiri, Jubilee Hills"),
    RestaurantMock(
        114,
        "Little Italy",
        "Vegan, Healthy",
        4.6,
        600,
        "Closes in 59 mins",
        true,
        kFood10,
        [
          MenuItemMock(10, "Vegan delight", 299, "Made with tofu, tempeh",
              kFood10, true),
          MenuItemMock(11, "Stir-fried veggies", 399, "Loaded with veggies",
              kFood8, true),
        ],
        "Softsol Tower-1 2nd floor A Wing, Infocity, Software Units Layout, Madhapur"),
    RestaurantMock(
        115,
        "Dhaba House",
        'North Indian, Chinese',
        2.4,
        150,
        "Closes in 20 mins",
        false,
        kFood3,
        [
          MenuItemMock(12, "Chicken Curry", 399, "With the goodness of spices",
              kFood5, false),
          MenuItemMock(13, "Fish fry", 299, "Spicy treat", kFood8, false),
        ],
        "P-187, R R District, S Lin Pally")
  ];
}
