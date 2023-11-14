class Login {
  String? token;
  String? name;
  int? patientId;
  String? pictureUrl;
  String? email;
  String? phone;
  String? status;
  String? type;
  String? fcmToken;
  String? device;
  String? deviceInfo;
  int? patientIdParent;

  Login(
      {this.token,
      this.name,
      this.patientId,
      this.pictureUrl,
      this.email,
      this.phone,
      this.status,
      this.type,
      this.fcmToken,
      this.device,
      this.deviceInfo,
      this.patientIdParent});

  Login.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    patientId = json['patient_id'];
    pictureUrl = json['picture_url'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    type = json['type'];
    fcmToken = json['fcm_token'];
    device = json['device'];
    deviceInfo = json['device_info'];
    patientIdParent = json['patient_id_parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['patient_id'] = this.patientId;
    data['picture_url'] = this.pictureUrl;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['type'] = this.type;
    data['fcm_token'] = this.fcmToken;
    data['device'] = this.device;
    data['device_info'] = this.deviceInfo;
    data['patient_id_parent'] = this.patientIdParent;
    return data;
  }
}
