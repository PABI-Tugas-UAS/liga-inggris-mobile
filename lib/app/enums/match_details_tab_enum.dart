enum MatchDetailsTabEnums { timeline, stats, lineUp }

extension MatchDetailsTabItem on MatchDetailsTabEnums {
  String get title {
    switch (this) {
      case MatchDetailsTabEnums.timeline:
        return "Timeline";
      case MatchDetailsTabEnums.stats:
        return "Stats";
      case MatchDetailsTabEnums.lineUp:
        return "Line Up";
    }
  }
}
