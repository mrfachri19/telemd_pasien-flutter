class KategoriSpesialisModel {
  String? doctorType;
  String? description;
  String? totalDoctors;
  String? iconUrl;

  KategoriSpesialisModel(
      {this.doctorType, this.description, this.totalDoctors, this.iconUrl});

  KategoriSpesialisModel.fromJson(Map<String, dynamic> json) {
    doctorType = json['doctor_type'];
    description = json['description'];
    totalDoctors = json['total_doctors'];
    iconUrl = json['icon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_type'] = this.doctorType;
    data['description'] = this.description;
    data['total_doctors'] = this.totalDoctors;
    data['icon_url'] = this.iconUrl;
    return data;
  }
}
