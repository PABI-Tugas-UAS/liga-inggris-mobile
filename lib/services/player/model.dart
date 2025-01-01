class PlayerModel {
  final int id;
  final int clubId;
  final int age;
  final String name;
  final String position;

  PlayerModel({
    required this.id,
    required this.clubId,
    required this.age,
    required this.name,
    required this.position,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      id: json['id'],
      clubId: json['club_id'],
      age: json['age'],
      name: json['name'],
      position: json['position'],
    );
  }
}
