class Review {
  String? id;
  String? userProfile;
  String? name;
  double? rating;
  String? comment;
  String? createdAt;

  Review(
      {this.id,
        this.userProfile,
        this.name,
        this.rating,
        this.comment,
        this.createdAt});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userProfile = json['userProfile'];
    name = json['name'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userProfile'] = this.userProfile;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
