class ComplementsModel {
  final String profession;
  final bool hasChildren;

  ComplementsModel({
    required this.profession,
    required this.hasChildren,
  });

  factory ComplementsModel.fromJson(Map<String, dynamic> json) {
    return ComplementsModel(
      profession: json['profession'],
      hasChildren: json['hasChildren'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['profession'] = profession;
    data['hasChildren'] = hasChildren;
    return data;
  }
}
