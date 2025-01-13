List<double> calculatePercentage(num x, num y) {
  if (x == 0 && y == 0) {
    return [50, 50];
  }
  num total = x + y;
  double xPercentage = (x / total) * 100;
  double yPercentage = (y / total) * 100;

  return [xPercentage, yPercentage];
}
