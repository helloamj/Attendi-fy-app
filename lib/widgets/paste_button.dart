import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:attendify/Models/attendance.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/attendance_table.dart';

class PasteButton extends StatefulWidget {
  const PasteButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasteButtonState createState() => _PasteButtonState();
}

class _PasteButtonState extends State<PasteButton> {
  TextEditingController prcntcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Future<bool> pasteFromClipboard() async {
      rep.lst.clear();
      rep.list2.clear();
      rep.list3.clear();
      rep.ta = 0;
      rep.tp = 0;
      rep.to = 0;
      String? value = prcntcontroller.text;
      if (value != "") {
        if (value != "" &&
            0 < double.parse(value) &&
            double.parse(value) < 100) {
          rep.desiredprcnt = double.parse(value);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('0 < Desired Attendance < 100')));
          return false;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Desired Attendace is Empty')));
        return false;
      }

      final clipboardData = await Clipboard.getData('text/plain');

      if (clipboardData != null) {
        rep.st = clipboardData.text.toString();
        rep.lst = rep.st!.split(RegExp(r'\r?\n'));

        if (rep.lst[0].toString() != " Attendance Report" ||
            rep.lst[2].split("	").length > 8) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Past valid Report')));
          return false;
        }

        for (var x in rep.lst) {
          var a = x.split("	");

          if (a.length > 2) {
            if (a[5] == "OD") {
              a.add("Individual Hours");
            } else {
              double totalprs = double.parse(a[4]);
              double totalod = double.parse(a[5]);
              double totalabs = double.parse(a[6]);
              rep.ta += totalabs;
              rep.to += totalod;
              rep.tp += totalprs;
              double p = rep.desiredprcnt / 100, q = 1 - p;
              if (double.parse(a[7]) < rep.desiredprcnt) {
                double ans = ((p * (totalabs + totalod + totalprs)) -
                        (totalod + totalprs)) /
                    q;
                ans = double.parse(ans.toStringAsFixed(2));
                a.add('${ans.ceil()} \nTo Take');
              } else {
                double ans = ((p * (totalabs + totalod + totalprs)) -
                        (totalod + totalprs)) /
                    p;
                ans = double.parse(ans.toStringAsFixed(2));
                a.add('${ans.abs().floor()} \nCan Leave');
              }
            }
          }
          rep.list2.add(a);
        }
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const AttendanceTable()));
        return true;
      }
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Past valid Report')));
      return false;
    }

    return Column(
      children: [
        const SizedBox(height: 16),
        SizedBox(
          width: width / 1.5,
          child: TextField(
            controller: prcntcontroller,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              hintText: '0 < Desired Attendance < 100',
              fillColor: Colors.white,
              filled: true,
              hintStyle: TextStyle(color: Color.fromARGB(123, 0, 0, 0)),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            onSubmitted: (val) {
              pasteFromClipboard();
            },
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff198754).withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 20,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: ElevatedButton(
              onPressed: () async {
                pasteFromClipboard();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff198754),
                padding: const EdgeInsets.all(15),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.paste,
                    size: 50,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Paste your ERP \nAttendance Report',
                    style: GoogleFonts.roboto(
                      // fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
