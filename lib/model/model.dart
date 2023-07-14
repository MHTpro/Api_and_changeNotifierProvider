class MainModel {
  final int? id;
  final String? title;

  MainModel({
    this.id,
    this.title,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      id: json["id"],
      title: json["title"],
    );
  }
}
