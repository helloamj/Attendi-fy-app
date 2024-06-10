import 'package:animate_gradient/animate_gradient.dart';
import 'package:attendify/src/view/global_widgets.dart';
import 'package:attendify/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_moving_background/enums/animation_types.dart';
import 'package:flutter_moving_background/flutter_moving_background.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

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
                        'Terms and Conditions',
                        style: TextStyle(
                          color: AppPallete.primaryWhite.level1,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildSection(
                        'Acceptance of Terms',
                        '''By using the Attendify app, you agree to be bound by these terms and conditions. If you do not agree to these terms, please do not use the app.''',
                      ),
                      _buildSection(
                        'Use of the App',
                        '''The Attendify app is designed to help students calculate and manage their attendance. You agree to use the app only for its intended purpose and in accordance with all applicable laws and regulations.''',
                      ),
                      _buildSection(
                        'User Responsibilities',
                        '''You are responsible for providing accurate and complete information when using the app. Attendify is not responsible for any errors or omissions in the information you provide.''',
                      ),
                      _buildSection(
                        'Intellectual Property',
                        '''All content and materials available on Attendify, including but not limited to text, graphics, logos, and software, are the property of Attendify and are protected by applicable intellectual property laws.''',
                      ),
                      _buildSection(
                        'Privacy Policy',
                        '''Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and protect your information.''',
                      ),
                      _buildSection(
                        'Limitation of Liability',
                        '''Attendify is not liable for any direct, indirect, incidental, or consequential damages arising from your use of the app. You use the app at your own risk.''',
                      ),
                      _buildSection(
                        'Changes to Terms',
                        '''We reserve the right to modify these terms and conditions at any time. Your continued use of the app after any changes constitutes your acceptance of the new terms.''',
                      ),
                      _buildSection(
                        'Contact Us',
                        '''If you have any questions or concerns about these terms and conditions, please contact us through our website.''',
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

  Widget _buildSection(String title, String content) {
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
          Text(
            content,
            style: TextStyle(
              color: AppPallete.primaryWhite.level1,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
