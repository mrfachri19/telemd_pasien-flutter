class PromoBannerModel {
  int? id;
  String? type;
  String? title;
  String? imageId;
  String? imageUrl;
  String? body;
  bool? isShow;
  String? postDate;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  PromoBannerModel(
      {this.id,
      this.type,
      this.title,
      this.imageId,
      this.imageUrl,
      this.body,
      this.isShow,
      this.postDate,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  PromoBannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    imageId = json['image_id'];
    imageUrl = json['image_url'];
    body = json['body'];
    isShow = json['is_show'];
    postDate = json['post_date'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['title'] = this.title;
    data['image_id'] = this.imageId;
    data['image_url'] = this.imageUrl;
    data['body'] = this.body;
    data['is_show'] = this.isShow;
    data['post_date'] = this.postDate;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
