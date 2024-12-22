class ClubModel {
  int? id;
  String? name;
  String? coach;
  int? foundedYear;
  List<String>? achievements;
  String? logo;

  ClubModel({
    this.id,
    this.name,
    this.coach,
    this.foundedYear,
    this.achievements,
    this.logo,
  });

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    return ClubModel(
      id: json['id'],
      name: json['name'],
      coach: json['coach'],
      foundedYear: json['foundedYear'],
      achievements: List<String>.from(json['achievements']),
      logo: json['logo'],
    );
  }
}
