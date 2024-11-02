import 'package:big_cart/configs/assets/image_assets.dart';

import '../../model/product/product_model.dart';

class Constants {

  static bool? themValue = false;
  static String currency = "\$";
  static double shippingCharges = 2.0;

  static double roundToTwoDecimalPlaces(double value) {
    return double.parse(value.toStringAsFixed(2));
  }

  static List<Map<String, String>> categories = [
    {'title': 'Vegetables', 'image': ImageAssets.vegetables},
    {'title': 'Fruits', 'image': ImageAssets.fruits},
    {'title': 'Beverages', 'image': ImageAssets.beverages},
    {'title': 'Grocery', 'image': ImageAssets.grocery},
    {'title': 'EdibleOil', 'image': ImageAssets.edibleOil},
    {'title': 'HouseHold', 'image': ImageAssets.houseHold},
    {'title': 'BabyCare', 'image': ImageAssets.babyCare},
  ];

  static List<String> imgList = [
    ImageAssets.carousel1,
    ImageAssets.carousel2,
    ImageAssets.carousel3,
    ImageAssets.carousel4,
    ImageAssets.carousel5,
  ];

  static List<Product> productsList = [
    Product(
      name: 'Fresh Peach',
      price: "8.00",
      currency: currency,
      unit: "dozen",
      qty: 1,
      image: ImageAssets.peach,
      isAdded: false,
      isFav: false,
      isNew: false,
      showLabel: false,
      disOffer: false,
      discount: 0,
      description:
          '''Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing''',
    ),
    Product(
      name: 'Avocado',
      price: "7.00",
      currency: currency,
      unit: "2 lbs",
      qty: 1,
      image: ImageAssets.avocado,
      isAdded: true,
      isFav: false,
      isNew: true,
      showLabel: true,
      disOffer: false,
      discount: 0,
      description:
          '''Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing''',
    ),
    Product(
      name: 'Pineapple',
      price: "9.90",
      currency: currency,
      unit: "1.50 lbs",
      qty: 1,
      image: ImageAssets.pineapple,
      isAdded: false,
      isFav: true,
      isNew: false,
      showLabel: false,
      disOffer: false,
      discount: 0,
      description:
          '''Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing''',
    ),
    Product(
      name: 'Black Grapes',
      price: "7.05",
      currency: currency,
      unit: "5.0 lbs",
      qty: 1,
      image: ImageAssets.blackGrapes,
      isAdded: false,
      isFav: false,
      isNew: false,
      showLabel: true,
      disOffer: true,
      discount: 0.2,
      description:
          '''Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing''',
    ),
    Product(
      name: 'Pomegranate',
      price: "2.09",
      currency: currency,
      unit: "1.50 lbs",
      qty: 1,
      image: ImageAssets.pomegranate,
      isAdded: true,
      isFav: false,
      isNew: true,
      showLabel: true,
      disOffer: false,
      discount: 0,
      description:
          '''Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing''',
    ),
    Product(
      name: 'Fresh B roccoli',
      price: "3.00",
      currency: currency,
      unit: "1 kg",
      qty: 1,
      image: ImageAssets.broccoli,
      isAdded: false,
      isFav: true,
      showLabel: false,
      isNew: false,
      disOffer: false,
      discount: 0,
      description:
          '''Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing''',
    ),
  ];
}
