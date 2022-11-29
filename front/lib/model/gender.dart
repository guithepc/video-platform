class Gender {
  final int id;
  final String name;

  Gender(this.id, this.name);

  static convertGender(gender) {
    return Gender(gender['id'], gender['name']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}
