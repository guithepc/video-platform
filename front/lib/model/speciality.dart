class Speciality {
  final int speId;
  final String name;

  Speciality(this.speId, this.name);

  static convertSpeciality(speciality) {
    return Speciality(speciality['id'], speciality['name']);
  }
}
