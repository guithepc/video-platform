class Gender {
  final int id;
  final String name;

  Gender(this.id, this.name);

  static convertGender(gender) {
    return Gender(gender['id'], gender['name']);
  }
}
