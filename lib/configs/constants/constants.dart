import 'package:big_cart/configs/assets/image_assets.dart';

import '../../model/product/product_model.dart';

class Constants {
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
        price: "\$8.00",
        unit: "dozen",
        image: ImageAssets.peach,
        isAdded: false,
        isFav: false,
        isNew: false,
        showLabel: false,
        disOffer: false,
        discount: ''),
    Product(
        name: 'Avocado',
        price: "\$7.00",
        unit: "2 lbs",
        image: ImageAssets.avocado,
        isAdded: true,
        isFav: false,
        isNew: true,
        showLabel: true,
        disOffer: false,
        discount: ''),
    Product(
        name: 'Pineapple',
        price: "\$9.90",
        unit: "1.50 lbs",
        image: ImageAssets.pineapple,
        isAdded: false,
        isFav: true,
        isNew: false,
        showLabel: false,
        disOffer: false,
        discount: ''),
    Product(
        name: 'Black Grapes',
        price: "\$7.05",
        unit: "5.0 lbs",
        image: ImageAssets.blackGrapes,
        isAdded: false,
        isFav: false,
        isNew: false,
        showLabel: true,
        disOffer: true,
        discount: '-20%'),
    Product(
        name: 'Pomegranate',
        price: "\$2.09",
        unit: "1.50 lbs",
        image: ImageAssets.pomegranate,
        isAdded: true,
        isFav: false,
        isNew: true,
        showLabel: true,
        disOffer: false,
        discount: ''),
    Product(
        name: 'Fresh B roccoli',
        price: "\$3.00",
        unit: "1 kg",
        image: ImageAssets.broccoli,
        isAdded: false,
        isFav: true,
        showLabel: false,
        isNew: false,
        disOffer: false,
        discount: ''),
  ];
}
