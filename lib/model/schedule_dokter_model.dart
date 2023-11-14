class ScheduleDokterModel {
  int? id;
  int? doctorId;
  String? day;
  String? startTime;
  String? endTime;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? serviceId;
  String? type;
  int? partnerId;

  ScheduleDokterModel(
      {this.id,
      this.doctorId,
      this.day,
      this.startTime,
      this.endTime,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.serviceId,
      this.type,
      this.partnerId});

  ScheduleDokterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    serviceId = json['service_id'];
    type = json['type'];
    partnerId = json['partner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['service_id'] = this.serviceId;
    data['type'] = this.type;
    data['partner_id'] = this.partnerId;
    return data;
  }
}
