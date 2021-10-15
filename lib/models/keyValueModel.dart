class keyValueModel {
  String name;
  int id;

  keyValueModel(this.name, this.id);

  factory keyValueModel.fromJson(Map<String, dynamic> json) => keyValueModel(
        json['name'],
        json['id'],
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}
