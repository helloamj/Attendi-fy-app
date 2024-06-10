import 'package:animate_gradient/animate_gradient.dart';
import 'package:attendify/src/view/global_widgets.dart';
import 'package:attendify/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_moving_background/enums/animation_types.dart';
import 'package:flutter_moving_background/flutter_moving_background.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const PersistantFAB(),
      body: AnimateGradient(
        primaryColors: const [
          Colors.pink,
          Colors.pinkAccent,
          Colors.white,
        ],
        secondaryColors: const [
          Colors.blue,
          Colors.blueAccent,
          Colors.white,
        ],
        child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width:
                      constraints.maxWidth > 600 ? 600 : constraints.maxWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'About us',
                        style: TextStyle(
                          color: AppPallete.primaryWhite.level1,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildSection(
                        'Our Mission',
                        '''Welcome to our Attendify app! We aim to make it easy for students to calculate the number of hours of classes they need to attend in order to achieve their desired attendance percentage. Our app simplifies the process of calculating attendance and saves time, making it easier for students to focus on their studies. We hope you find our app useful!''',
                      ),
                      _buildSection(
                        'How Attendify Helps',
                        '''We understand that managing attendance can be a challenge, and our goal is to alleviate that burden. With Attendify, you can quickly and accurately determine the number of classes you need to attend to maintain or improve your attendance percentage. This ensures you stay on track with your academic goals and avoid any potential issues related to attendance.''',
                      ),
                      _buildSection(
                        'Features',
                        '''Our app allows you to input your class schedule, current attendance, and desired attendance percentage. Attendify then calculates the exact number of hours you need to attend to meet your target. This allows you to plan your study time and other activities more effectively.''',
                      ),
                      _buildSection(
                        'Continuous Improvement',
                        '''We are committed to providing a seamless and user-friendly experience. Our team is constantly working on updates and new features to improve the app and better serve your needs. We welcome feedback and suggestions from our users, as your input helps us create a better product.''',
                      ),
                      _buildSection(
                        'Our Website',
                        '''Our website is an important resource for all things related to Attendify. We regularly post updates, tips, and important information to help you get the most out of the app. Be sure to check our website frequently for the latest news and updates.\n\nWe also offer support through our website. If you have any questions or encounter any issues while using the app, our support team is here to help. You can find FAQs, troubleshooting guides, and contact information on our website. We're dedicated to ensuring you have a positive experience with Attendify.''',
                      ),
                      _buildSection(
                        'Community Support',
                        '''Your support and love are essential to us. We appreciate every user who downloads and uses our app, and we're grateful for your trust in Attendify. We believe that with your help, we can make a significant impact on students' academic lives by making attendance management easier and more efficient.''',
                      ),
                      _buildSection(
                        'Thank You',
                        '''Thank you for visiting our site and for choosing Attendify as your attendance management solution. We're excited to have you on board and look forward to supporting you in achieving your academic goals. Together, we can make attendance tracking a hassle-free experience, allowing you to focus more on your studies and less on administrative tasks.\n\nStay connected with us through our website and social media channels. Follow us for the latest updates, tips, and community events. We love hearing from our users and engaging with you online.\n\nAs we continue to grow and improve, we remain committed to our mission of helping students succeed. Your success is our success, and we're here to support you every step of the way. Thank you for being a part of the Attendify community.\n\nWe hope you find our app useful and that it helps you manage your attendance more effectively. Remember, our team is always here to assist you with any questions or concerns. Your satisfaction is our top priority.\n\nKeep an eye out for exciting new features and updates coming soon. We're always working to enhance Attendify and make it even more valuable for our users. Thank you for your support and for being a part of our journey.\n\nBest regards,\n\nThe Attendify Team''',
                      ),
                      _buildSection(
                        'Developers GitHub Profiles:',
                        null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () async {
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
                                '1. Kunal Jain',
                                style: TextStyle(
                                  color: AppPallete.primaryWhite.level1,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
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
                                '2. Jainam Jain',
                                style: TextStyle(
                                  color: AppPallete.primaryWhite.level1,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
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
                                '3. Kavya Khandelwal',
                                style: TextStyle(
                                  color: AppPallete.primaryWhite.level1,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSection(String title, String? content, {Widget? child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppPallete.primaryWhite.level1,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          content != null
              ? Text(
                  content,
                  style: TextStyle(
                    color: AppPallete.primaryWhite.level1,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                )
              : child!,
        ],
      ),
    );
  }
}
