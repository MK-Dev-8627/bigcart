class Product {
  String? name;
  String? image;
  String? unit;
  String? price;
  bool? isFav;
  bool? isAdded;
  bool? disOffer;
  String? discount;
  bool? isNew;
  bool? showLabel;

  Product(
      {this.name,
        this.image,
        this.unit,
        this.price,
        this.isFav,
        this.isAdded,
        this.disOffer,
        this.discount,
        this.isNew,
        this.showLabel});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    unit = json['unit'];
    price = json['price'];
    isFav = json['isFav'];
    isAdded = json['isAdded'];
    disOffer = json['disOffer'];
    discount = json['discount'];
    isNew = json['isNew'];
    showLabel = json['showLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['unit'] = this.unit;
    data['price'] = this.price;
    data['isFav'] = this.isFav;
    data['isAdded'] = this.isAdded;
    data['disOffer'] = this.disOffer;
    data['discount'] = this.discount;
    data['isNew'] = this.isNew;
    data['showLabel'] = this.showLabel;
    return data;
  }
}
