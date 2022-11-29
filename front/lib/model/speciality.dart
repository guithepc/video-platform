class Speciality {
  final int id;
  final String name;

  Speciality(this.id, this.name);

  static convertSpeciality(speciality) {
    return Speciality(speciality['id'], speciality['name']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}
