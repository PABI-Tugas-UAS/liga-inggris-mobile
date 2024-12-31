String convertDate(String inputDate) {
  const monthNames = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];

  DateTime date = DateTime.parse(inputDate);

  int day = date.day;
  String month = monthNames[date.month - 1];
  int year = date.year;

  return "$day $month $year";
}
