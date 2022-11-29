class Clinic {
  final int? id;
  final String? name;
  final String? companyName;
  final String? address;

  Clinic(this.id, this.name, this.companyName, this.address);

  static convertClinic(clinic) {
    return Clinic(clinic['id'], clinic['name'], clinic['company_name'],
        clinic['address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['companyName'] = companyName;
    _data['address'] = address;
    return _data;
  }
}
