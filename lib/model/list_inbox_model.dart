class ListInboxModel {
  int? id;
  String? title;
  String? description;
  bool? isRead;
  String? createdAt;
  String? updateAt;
  int? userId;
  String? userType;
  String? type;
  Meta? meta;

  ListInboxModel(
      {this.id,
      this.title,
      this.description,
      this.isRead,
      this.createdAt,
      this.updateAt,
      this.userId,
      this.userType,
      this.type,
      this.meta});

  ListInboxModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
    userId = json['user_id'];
    userType = json['user_type'];
    type = json['type'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['is_read'] = this.isRead;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['type'] = this.type;
    if (this.meta != null) {
      data['meta'] = this.meta?.toJson();
    }
    return data;
  }
}

class Meta {
  int? orderId;
  String? orderCode;
  String? serviceName;
  int? patientId;

  Meta({this.orderId, this.orderCode, this.serviceName, this.patientId});

  Meta.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderCode = json['order_code'];
    serviceName = json['service_name'];
    patientId = json['patient_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_code'] = this.orderCode;
    data['service_name'] = this.serviceName;
    data['patient_id'] = this.patientId;
    return data;
  }
}
