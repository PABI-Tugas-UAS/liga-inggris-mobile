List<double> calculatePercentage(num x, num y) {
  num total = x + y;
  double xPercentage = (x / total) * 100;
  double yPercentage = (y / total) * 100;

  return [xPercentage, yPercentage];
}