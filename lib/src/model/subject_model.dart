import 'dart:developer';

import 'package:acronym/acronym.dart';
import 'package:attendify/src/controller/result_page_provider.dart';
import 'package:attendify/src/view/result_page/result_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectModel {
  final int id;
  final String subjectCode;
  final String subject;
  final String subjectType;
  final int present;
  final int od;
  final int absent;
  final double percentage;
  int? toTake;
  int? canLeave;

  SubjectModel(
      {required this.id,
      required this.subjectCode,
      required this.subject,
      required this.subjectType,
      required this.present,
      required this.od,
      required this.absent,
      required this.percentage,
      this.toTake = 0,
      this.canLeave = 0,
      required BuildContext context});

  void updateHours(double desiredPercentage) {
    double floatDesiredPercentage = desiredPercentage / 100,
        q = 1 - floatDesiredPercentage;
    if (percentage < desiredPercentage) {
      double ans = ((floatDesiredPercentage * (absent + od + present)) -
              (od + present)) /
          q;
      toTake = double.parse(ans.toStringAsFixed(2)).ceil();
      canLeave = 0;
    } else {
      double ans = ((floatDesiredPercentage * (absent + od + present)) -
              (od + present)) /
          floatDesiredPercentage;
      toTake = 0;
      canLeave = double.parse(ans.toStringAsFixed(2)).abs().floor();
    }
  }

  factory SubjectModel.fromString(String str, BuildContext context) {
    List<String> data = str.split('\t');
    return SubjectModel(
        id: int.parse(data[0]),
        subjectCode: data[1],
        subject: generateAcronym(data[2], stopWords: ["lab", "and"]) +
            ((data[3] == 'Lab') ? ' LAB' : ''),
        subjectType: data[3],
        present: int.parse(data[4]),
        od: int.parse(data[5]),
        absent: int.parse(data[6]),
        percentage: double.parse(data[7]),
        context: context);
  }

  String toStringProv() {
    return 'SubjectModel(id: $id, subjectCode: $subjectCode, subject: $subject, subjectType: $subjectType, present: $present, od: $od, absent: $absent, percentage: $percentage, toTake: $toTake, canLeave: $canLeave)';
  }
}
