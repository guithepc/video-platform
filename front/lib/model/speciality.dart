class Speciality {
  final int id;
  final String name;

  Speciality(this.id, this.name);

  static convertSpeciality(speciality) {
    return Speciality(speciality['id'], speciality['name']);
  }
}
