import 'package:liga_inggris_mobile/services/match/model.dart';
import 'package:liga_inggris_mobile/services/player/model.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'coach': coach,
      'foundedYear': foundedYear,
      'achievements': achievements,
      'logo': logo,
    };
  }
}

class ClubDetailModel {
  final int id;
  final String name;
  final String coach;
  final int foundedYear;
  final List<String> achievements;
  final String logo;
  final List<PlayerModel> players;
  final List<MatchModel> previousMatches;

  ClubDetailModel({
    required this.id,
    required this.name,
    required this.coach,
    required this.foundedYear,
    required this.achievements,
    required this.logo,
    required this.players,
    required this.previousMatches,
  });

  factory ClubDetailModel.fromJson(Map<String, dynamic> json) {
    return ClubDetailModel(
      id: json['id'],
      name: json['name'],
      coach: json['coach'],
      foundedYear: json['founded_year'],
      achievements: List<String>.from(json['achievements']),
      logo: json['logo'],
      players: PlayerModel.fromJsonList(json['players']),
      previousMatches: MatchModel.fromJsonList(json['previous_matches']),
    );
  }
}
