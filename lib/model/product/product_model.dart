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
  int? qty;
  int? rate;
  String? description;

  Product({
    this.name,
    this.image,
    this.unit,
    this.price,
    this.qty,
    this.isFav,
    this.isAdded,
    this.disOffer,
    this.discount,
    this.isNew,
    this.showLabel,
    this.rate,
    this.description,
  });

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    unit = json['unit'];
    price = json['price'];
    qty = json['qty'];
    isFav = json['isFav'];
    isAdded = json['isAdded'];
    disOffer = json['disOffer'];
    discount = json['discount'];
    isNew = json['isNew'];
    showLabel = json['showLabel'];
    rate = json['rate'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['unit'] = this.unit;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['isFav'] = this.isFav;
    data['isAdded'] = this.isAdded;
    data['disOffer'] = this.disOffer;
    data['discount'] = this.discount;
    data['isNew'] = this.isNew;
    data['showLabel'] = this.showLabel;
    data['rate'] = this.rate;
    data['description'] = this.description;
    return data;
  }

  void toggleFavorite() {
    isFav = !isFav!;
  }

  void toggleAdded() {
    isAdded = !isAdded!;
  }
}
