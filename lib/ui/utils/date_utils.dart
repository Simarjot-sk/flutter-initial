import 'package:flutter/material.dart';

String getDayName(int index) {
  return ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"][index];
}

String getDayNameFull(int index) {
  return [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ][index];
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay addDuration(Duration duration) {
    final updatedDateTime = toDateTime().add(duration);
    return TimeOfDay.fromDateTime(updatedDateTime);
  }

  TimeOfDay subtractDuration(Duration duration) {
    final updatedDateTime = toDateTime().subtract(duration);
    return TimeOfDay.fromDateTime(updatedDateTime);
  }

  bool isAfter(TimeOfDay other) {
    return toDateTime().isAfter(other.toDateTime());
  }

  bool isBefore(TimeOfDay other) {
    return toDateTime().isBefore(other.toDateTime());
  }

  bool isAfterOrSame(TimeOfDay other) {
    return toDateTime().isAfter(other.toDateTime()) || isSame(other);
  }

  bool isBeforeOrSame(TimeOfDay other) {
    return toDateTime().isBefore(other.toDateTime()) || isSame(other);
  }

  bool isSame(TimeOfDay other) {
    return toDateTime().isAtSameMomentAs(other.toDateTime());
  }

  DateTime toDateTime() {
    //date, month and year do not matter in our case
    return DateTime(2022, 1, 1, hour, minute);
  }

  ///returns time in 12 hour format without am/pm
  ///format hh:mm
  String prettyTime(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    return localizations
        .formatTimeOfDay(this)
        .replaceFirst("AM", "")
        .replaceAll("PM", "");
  }
}

extension StringExtension on String {
  ///input date should be of format: HH:mm
  TimeOfDay parseTimeOfDay() {
    final split = this.split(":");
    final hourString = split[0];
    final minuteString = split[1];

    return TimeOfDay(
      hour: int.parse(hourString),
      minute: int.parse(minuteString),
    );
  }

  TimeOfDay? tryParseTimeOfDay() {
    try {
      return parseTimeOfDay();
    } catch (th) {
      return null;
    }
  }
}
