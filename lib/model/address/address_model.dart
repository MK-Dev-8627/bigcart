class MyAddress {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? city;
  String? zipcode;
  String? country;
  bool? makeDefault;
  bool? show;

  MyAddress(
      {this.id,
        this.name,
        this.phone,
        this.address,
        this.city,
        this.zipcode,
        this.country,
        this.makeDefault,
        this.show});

  MyAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    zipcode = json['zipcode'];
    country = json['country'];
    makeDefault = json['makeDefault'];
    show = json['show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    data['country'] = this.country;
    data['makeDefault'] = this.makeDefault;
    data['show'] = this.show;
    return data;
  }

  void toggleShow() {
    show = !show!;
  }
}
