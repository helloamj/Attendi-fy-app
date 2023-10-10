import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/paste_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Attendance Calculator',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
              textAlign: TextAlign.center,
            ),
            const PasteButton(),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.3,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/tutorial/tutorial.jpeg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
