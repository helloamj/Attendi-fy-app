import 'dart:developer';

import 'package:attendify/src/model/subject_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ResultsProvider extends ChangeNotifier {
  double _currentPercentage = 0.0;
  bool _isLoading = true;
  double _desiredPercentage = 75;
  final _subjects = <SubjectModel>[];
  int _toTake = 0;
  int _canLeave = 0;
  List<SubjectModel> get subjects => _subjects;
  double get currentPercentage => _currentPercentage;
  double get desiredPercentage => _desiredPercentage;
  int get toTake => _toTake;
  int get canLeave => _canLeave;
  bool get isLoading => _isLoading;

  set desiredPercentage(double value) {
    _desiredPercentage = value;
    updateResult();
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void addResult(SubjectModel result) {
    _subjects.add(result);
    notifyListeners();
  }

  void decrementDesiredPercentage() {
    if (_desiredPercentage > 1) {
      _desiredPercentage--;
      updateResult();
    }
  }

  void incrementDesiredPercentage() {
    if (_desiredPercentage < 99) {
      _desiredPercentage++;
      updateResult();
    }
  }

  Future<void> updateResult() async {
    isLoading = true;
    for (var e in _subjects) {
      e.updateHours(_desiredPercentage);
    }
    calculateResult();
    isLoading = false;
    notifyListeners();
  }

  void clearResults() {
    _subjects.clear();
    _desiredPercentage = 75;
    notifyListeners();
  }

  void calculateResult() {
    int totalPresent = 0;
    int totalOD = 0;
    int totalAbsent = 0;
    for (var e in _subjects) {
      log(e.present.toString());
      totalPresent += e.present;
    }
    for (var e in _subjects) {
      totalOD += e.od;
    }
    for (var e in _subjects) {
      totalAbsent += e.absent;
    }
    log('Total Present: $totalPresent, Total OD: $totalOD, Total Absent: $totalAbsent');
    _currentPercentage =
        (totalPresent + totalOD) / (totalPresent + totalOD + totalAbsent);
    log(_currentPercentage.toString());
    if (_currentPercentage > (_desiredPercentage / 100)) {
      _toTake = 0;
      _canLeave = double.parse((((_desiredPercentage / 100) *
                          (totalPresent + totalOD + totalAbsent) -
                      (totalPresent + totalOD)) /
                  (_desiredPercentage / 100))
              .abs()
              .toStringAsFixed(2))
          .floor();
    } else {
      _canLeave = 0;
      _toTake = double.parse((((_desiredPercentage / 100) *
                          (totalPresent + totalOD + totalAbsent) -
                      (totalPresent + totalOD)) /
                  (1 - (_desiredPercentage / 100)))
              .abs()
              .toStringAsFixed(2))
          .ceil();
    }
    notifyListeners();
  }
}
