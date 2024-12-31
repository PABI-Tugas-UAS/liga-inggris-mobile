import 'package:liga_inggris_mobile/services/club/model.dart';

class MatchModel {
  final int id;
  final ClubModel homeClub;
  final ClubModel awayClub;
  final int homeScore;
  final int awayScore;
  final String date;
  final String time;
  final String location;
  final String status;

  MatchModel({
    required this.id,
    required this.homeClub,
    required this.awayClub,
    required this.homeScore,
    required this.awayScore,
    required this.date,
    required this.time,
    required this.location,
    required this.status,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      id: json['id'],
      homeClub: ClubModel.fromJson(json['home_club']),
      awayClub: ClubModel.fromJson(json['away_club']),
      homeScore: json['home_score'],
      awayScore: json['away_score'],
      date: json['date'],
      time: json['time'],
      location: json['location'],
      status: json['status'],
    );
  }
}

class MatchDetailModel {
  final int id;
  final ClubModel homeClub;
  final ClubModel awayClub;
  final int homeScore;
  final int awayScore;
  final String date;
  final String time;
  final String location;
  final String status;

  MatchDetailModel({
    required this.id,
    required this.homeClub,
    required this.awayClub,
    required this.homeScore,
    required this.awayScore,
    required this.date,
    required this.time,
    required this.location,
    required this.status,
  });

  factory MatchDetailModel.fromJson(Map<String, dynamic> json) {
    return MatchDetailModel(
      id: json['id'],
      homeClub: ClubModel.fromJson(json['home_club']),
      awayClub: ClubModel.fromJson(json['away_club']),
      homeScore: json['home_score'],
      awayScore: json['away_score'],
      date: json['date'],
      time: json['time'],
      location: json['location'],
      status: json['status'],
    );
  }
}
