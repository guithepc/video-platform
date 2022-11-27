class Status {
  final int id;
  final String name;
  final String code;

  Status(this.id, this.name, this.code);

  static convertStatus(status) {
    return Status(status['id'], status['name'], status['code']);
  }
}
