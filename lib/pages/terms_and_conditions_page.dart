import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
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
          child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'TERMS AND CONDITIONS',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xff198754),
                    border: Border.all(
                      color: const Color(0xff198754),
                      width: 5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff198754).withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 20,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "By using our Attendify app, you agree to the following terms and conditions:",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "  1. The information provided by our app is for educational purposes only and should not be considered as professional advice.\n\n  2. We do not guarantee the accuracy or completeness of the information provided by our app. The calculations provided by our app should be used as a guide only.\n\n  3. We are not responsible for any errors, omissions, or inaccuracies in the information provided by our app.\n\n  4. We reserve the right to modify or discontinue our app at any time without prior notice.\n\n  5. We are not responsible for any damages or losses resulting from the use of our app.",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xff212529),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Have a Nice Day!',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ]),
      )),
    );
  }
}
