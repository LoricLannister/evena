import 'package:intl/intl.dart';

class Utils {
  static String toDate(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    return '$date';
  }

  static String toTime(DateTime dateTime) {
    final time = DateFormat.Hm().format(dateTime);
    return '$time';
  }

  static List<int> toHourAndMinute(String interval) {
    final times = interval.split('-');
    final endTime = times[1].trim();
    final hour = int.parse(endTime.split('h')[0]);
    final minute = int.parse(endTime.split('h')[1].replaceFirst('min', ''));
    return [hour, minute];
  }

  static String toDay(int day) {
    if (day == 1) {
      return 'Lundi';
    } else if (day == 2) {
      return 'Mardi';
    } else if (day == 3) {
      return 'Mercredi';
    } else if (day == 4) {
      return 'Jeudi';
    } else if (day == 5) {
      return 'Vendredi';
    } else if (day == 6) {
      return 'Samedi';
    } else {
      return 'Dimanche';
    }
  }

  static String toMonth(int month) {
    if (month == 1) {
      return 'Janvier';
    } else if (month == 2) {
      return 'Février';
    } else if (month == 3) {
      return 'Mars';
    } else if (month == 4) {
      return 'Avril';
    } else if (month == 5) {
      return 'Mai';
    } else if (month == 6) {
      return 'Juin';
    } else if (month == 7) {
      return 'Juillet';
    } else if (month == 8) {
      return 'Août';
    } else if (month == 9) {
      return 'Septembre';
    } else if (month == 10) {
      return 'Octobre';
    } else if (month == 11) {
      return 'Novembre';
    } else {
      return 'Decembre';
    }
  }

  static int toIntDay(String day) {
    if (day == 'Lundi') {
      return 1;
    } else if (day == 'Mardi') {
      return 2;
    } else if (day == 'Mercredi') {
      return 3;
    } else if (day == 'Jeudi') {
      return 4;
    } else if (day == 'Vendredi') {
      return 5;
    } else if (day == 'Samedi') {
      return 6;
    } else {
      return 7;
    }
  }

  static int toIntMonth(String month) {
    if (month == 'Janvier') {
      return 1;
    } else if (month == 'Février') {
      return 2;
    } else if (month == 'Mars') {
      return 3;
    } else if (month == 'Avril') {
      return 4;
    } else if (month == 'Mai') {
      return 5;
    } else if (month == 'Juin') {
      return 6;
    } else if (month == 'Juillet') {
      return 7;
    } else if (month == 'Août') {
      return 8;
    } else if (month == 'Septembre') {
      return 9;
    } else if (month == 'Octobre') {
      return 10;
    } else if (month == 'Novembre') {
      return 11;
    } else {
      return 12;
    }
  }
}
