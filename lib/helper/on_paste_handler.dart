import 'dart:developer';
import 'dart:isolate';

import 'package:attendify/src/model/subject_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../src/controller/result_page_provider.dart';

class OnPasteHandler {
  static Future<bool> onPaste(BuildContext context) async {
    try {
      final clipboardData = await Clipboard.getData('text/plain');
      if (clipboardData == null) {
        return false;
      }
      log(clipboardData.text.toString());
      if (clipboardData.text.toString().contains('Attendance Report') ==
              false ||
          clipboardData.text.toString().contains('Faculty Name')) {
        return false;
      }
      List<String> splittedLines = clipboardData.text.toString().split('\n');

      splittedLines.removeRange(0, 3);
      Provider.of<ResultsProvider>(context, listen: false).clearResults();
      await Future.forEach(splittedLines, (String line) async {
        Provider.of<ResultsProvider>(context, listen: false).addResult(
          SubjectModel.fromString(line, context),
        );
      });
      return true;
    } on Exception catch (e) {
      log(e.toString());
    }
    return false;
  }
}
