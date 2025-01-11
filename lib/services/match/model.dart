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

  static List<MatchModel> fromJsonList(List<dynamic> jsonList) {
    List<MatchModel> items = [];
    for (var i = 0; i < jsonList.length; i++) {
      items.add(MatchModel.fromJson(jsonList[i]));
    }
    return items;
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
  final MatchStatsModel matchStats;

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
    required this.matchStats,
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
      matchStats: MatchStatsModel.fromJson(json['match_stats']),
    );
  }
}

class StatsModel {
  final int home;
  final int away;

  StatsModel({
    required this.home,
    required this.away,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      home: json['home'],
      away: json['away'],
    );
  }
}

class MatchStatsModel {
  final int id;
  final int matchId;
  final Map<String, StatsModel> stats;
  final List<TimelineModel> timeline;

  MatchStatsModel({
    required this.id,
    required this.matchId,
    required this.stats,
    required this.timeline,
  });

  factory MatchStatsModel.fromJson(Map<String, dynamic> json) {
    return MatchStatsModel(
      id: json['id'],
      matchId: json['match_id'],
      stats: (json['stats'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, StatsModel.fromJson(value))),
      timeline: (json['timeline'] as List<dynamic>)
          .map((e) => TimelineModel.fromJson(e))
          .toList(),
    );
  }
}

class TimelineModel {
  final String description;
  final int minute;
  final String team;

  TimelineModel({
    required this.description,
    required this.minute,
    required this.team,
  });

  factory TimelineModel.fromJson(Map<String, dynamic> json) {
    return TimelineModel(
      description: json['description'],
      minute: json['minute'],
      team: json['team'],
    );
  }
}
