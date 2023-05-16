import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutTeam extends StatefulWidget {
  const AboutTeam({super.key});

  @override
  State<AboutTeam> createState() => _AboutTeamState();
}

class _AboutTeamState extends State<AboutTeam> {
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
                'ABOUT TEAM LEGACY',
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
                        "We Are Team Legacy, Inspired by the idea to create a legacy for students all around the world. This website is created in order to save students from getting debarred from examinations due to low attendance.",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xff212529),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Developers Profile Links:",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                              onTap: () async {
                                var uri =
                                    Uri.parse("https://github.com/helloamj");
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri,
                                      mode: LaunchMode.externalApplication);
                                } else {
                                  // can't launch url
                                }
                              },
                              child: Text(
                                "Kunal Jain",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  textStyle: const TextStyle(decoration: TextDecoration.underline,),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                var uri =
                                    Uri.parse("https://github.com/Jainamrockk");
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri,
                                      mode: LaunchMode.externalApplication);
                                } else {
                                  // can't launch url
                                }
                              },
                              child: Text(
                                "Jainam Jain",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  textStyle: const TextStyle(decoration: TextDecoration.underline,),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                var uri =
                                    Uri.parse("https://github.com/k24747");
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri,
                                      mode: LaunchMode.externalApplication);
                                } else {
                                  // can't launch url
                                }
                              },
                              child: Text(
                                "Kavya Khandelwal",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  textStyle: const TextStyle(decoration: TextDecoration.underline,),
                                ),
                                textAlign: TextAlign.center,
                              ),
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
