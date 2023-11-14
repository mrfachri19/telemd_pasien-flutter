class ServiceCategoryModel {
  int? id;
  String? name;
  String? nama;
  String? description;
  int? iconId;
  String? iconUrl;
  bool? isActive;
  bool? isVisible;
  bool? isUseConsumable;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? price;
  bool? useAppointment;
  int? shareFee;
  int? order;

  ServiceCategoryModel(
      {this.id,
      this.name,
      this.nama,
      this.description,
      this.iconId,
      this.iconUrl,
      this.isActive,
      this.isVisible,
      this.isUseConsumable,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.price,
      this.useAppointment,
      this.shareFee,
      this.order});

  ServiceCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nama = json['nama'];
    description = json['description'];
    iconId = json['icon_id'];
    iconUrl = json['icon_url'];
    isActive = json['is_active'];
    isVisible = json['is_visible'];
    isUseConsumable = json['is_use_consumable'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    price = json['price'];
    useAppointment = json['use_appointment'];
    shareFee = json['share_fee'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nama'] = this.nama;
    data['description'] = this.description;
    data['icon_id'] = this.iconId;
    data['icon_url'] = this.iconUrl;
    data['is_active'] = this.isActive;
    data['is_visible'] = this.isVisible;
    data['is_use_consumable'] = this.isUseConsumable;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['price'] = this.price;
    data['use_appointment'] = this.useAppointment;
    data['share_fee'] = this.shareFee;
    data['order'] = this.order;
    return data;
  }
}
