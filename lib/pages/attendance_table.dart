import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attendify/Models/attendance.dart';

import '../Models/meme.dart';

class AttendanceTable extends StatefulWidget {
  const AttendanceTable({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AttendanceTableState createState() => _AttendanceTableState();
}

class _AttendanceTableState extends State<AttendanceTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212529),
      appBar: AppBar(
        title: Text(
          'ATTENDIFY',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff198754),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            rep.getfirst(),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xff198754),
                border: Border.all(
                  color:  Colors.white,
                  width: 2,
                ),
                
              ),
              child: ClipRRect(
                  child: Image.asset(Memes.getmeme())),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                defaultColumnWidth: const FixedColumnWidth(125),
                columnWidths: const {
                  2: FixedColumnWidth(300),
                },
                border: TableBorder.all(
                    color: Colors.white, style: BorderStyle.solid),
                children: rep.gettable(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
