class ListDokterChatModel {
  int? id;
  String? name;
  String? description;
  String? experience;
  String? clinic;
  String? university;
  String? type;
  String? pictureUrl;
  int? price;
  String? shareFeeType;
  int? shareFeePercent;
  int? shareFeeNominal;
  String? shareFeeFor;
  int? tenantFee;
  int? renterFee;
  String? discountType;
  int? discountPercent;
  int? discountNominal;
  int? finalPrice;
  int? adminFee;
  String? status;
  String? rating;
  String? schedules;

  ListDokterChatModel(
      {this.id,
      this.name,
      this.description,
      this.experience,
      this.clinic,
      this.university,
      this.type,
      this.pictureUrl,
      this.price,
      this.shareFeeType,
      this.shareFeePercent,
      this.shareFeeNominal,
      this.shareFeeFor,
      this.tenantFee,
      this.renterFee,
      this.discountType,
      this.discountPercent,
      this.discountNominal,
      this.finalPrice,
      this.adminFee,
      this.status,
      this.rating,
      this.schedules});

  ListDokterChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    experience = json['experience'];
    clinic = json['clinic'];
    university = json['university'];
    type = json['type'];
    pictureUrl = json['picture_url'];
    price = json['price'];
    shareFeeType = json['share_fee_type'];
    shareFeePercent = json['share_fee_percent'];
    shareFeeNominal = json['share_fee_nominal'];
    shareFeeFor = json['share_fee_for'];
    tenantFee = json['tenant_fee'];
    renterFee = json['renter_fee'];
    discountType = json['discount_type'];
    discountPercent = json['discount_percent'];
    discountNominal = json['discount_nominal'];
    finalPrice = json['final_price'];
    adminFee = json['admin_fee'];
    status = json['status'];
    rating = json['rating'];
    schedules = json['schedules'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['experience'] = this.experience;
    data['clinic'] = this.clinic;
    data['university'] = this.university;
    data['type'] = this.type;
    data['picture_url'] = this.pictureUrl;
    data['price'] = this.price;
    data['share_fee_type'] = this.shareFeeType;
    data['share_fee_percent'] = this.shareFeePercent;
    data['share_fee_nominal'] = this.shareFeeNominal;
    data['share_fee_for'] = this.shareFeeFor;
    data['tenant_fee'] = this.tenantFee;
    data['renter_fee'] = this.renterFee;
    data['discount_type'] = this.discountType;
    data['discount_percent'] = this.discountPercent;
    data['discount_nominal'] = this.discountNominal;
    data['final_price'] = this.finalPrice;
    data['admin_fee'] = this.adminFee;
    data['status'] = this.status;
    data['rating'] = this.rating;
    data['schedules'] = this.schedules;
    return data;
  }
}
