import 'package:attendify/pages/about_team_legacy.dart';
import 'package:attendify/pages/attendance_calc.dart';
import 'package:attendify/pages/terms_and_conditions_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'about_us_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.analytics});
  final FirebaseAnalytics analytics;
  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _HomePageState createState() => _HomePageState(analytics: analytics);
}

class _HomePageState extends State<HomePage> {
  _HomePageState({required this.analytics});
  final FirebaseAnalytics analytics;
  @override
  Widget build(BuildContext context) {
    analytics.setCurrentScreen(screenName: 'Home Screen');
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff198754),
              ),
              child: Center(
                child: Text(
                  'Connect Drawer',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('About us'),
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const AboutUsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.gavel),
              title: const Text('Terms and Conditions'),
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const TermsAndConditions()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.diversity_2),
              title: const Text('About Team Legacy'),
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const AboutTeam()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.send),
              title: const Text('Post Suggestion'),
              onTap: () async {
                var uri = Uri.parse("https://telegram.me/AttendifySuggestions");
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  // can't launch url
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.diversity_3),
              title: const Text('Join Community'),
              subtitle: const Text('For further app updates'),
              onTap: () async {
                var uri = Uri.parse("https://t.me/+SUuVpa4fIghmMWZl");
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  // can't launch url
                }
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextStyle(
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                  textAlign: TextAlign.center,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Welcome to ATTENDIFY',
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Attendance is a Bug!\nDon't Worry We Have Got A Solution For You",
                  style: GoogleFonts.roboto(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
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
                        onPressed: () {
                          analytics.logEvent(name: 'Button Clicked');
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const Calculator()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff198754),
                          padding: const EdgeInsets.all(15),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calculate,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              ' Attendance Calculator',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                // const SizedBox(
                //   height: 50,
                // ),
                // TextButton(onPressed: ()async {
                //   var uri = Uri.parse("https://t.me/+SUuVpa4fIghmMWZl");
                //   if (await canLaunchUrl(uri)) {
                //     await launchUrl(uri, mode: LaunchMode.externalApplication);
                //   } else {
                //     // can't launch url
                //   }
                // },

                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //   const Icon(Icons.warning,color: Colors.yellow),
                //   Text(
                //               ' Click Here for Further App Updates',
                //               style: GoogleFonts.roboto(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 17,
                //                 color: Colors.yellow,
                //               ),
                //             ),
                // ],))
              ]),
        ),
      )),
    );
  }
}
