import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
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
                'ABOUT US',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome To ATTENDIFY',
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
                        "Welcome to our Attendify app! We aim to make it easy for students to calculate the number of hours of classes they need to attend in order to achieve their desired attendance percentage. Our app simplifies the process of calculating attendance and saves time, making it easier for students to focus on their studies. We hope you find our app useful!\n\nWe will keep posting more important stuff on our Website for all of you. Please give your support and love.\n\nThanks For Visiting Our Site",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xff212529),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Have a Nice Day!',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  )),
            ]),
      )),
    );
  }
}
