enum LineupTabEnums { home, away }

extension LineupTabItem on LineupTabEnums {
  String get title {
    switch (this) {
      case LineupTabEnums.home:
        return "Home";
      case LineupTabEnums.away:
        return "Away";
    }
  }
}
