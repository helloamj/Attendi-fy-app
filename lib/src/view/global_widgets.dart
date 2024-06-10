import 'dart:math';

import 'package:attendify/helper/router.dart';
import 'package:attendify/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class PersistantFAB extends StatelessWidget {
  const PersistantFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ExpandableFab(
        distance: min(constraints.maxHeight, constraints.maxWidth) * 0.5,
        overlayStyle: ExpandableFabOverlayStyle(
          blur: 15,
        ),
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.menu),
          fabSize: ExpandableFabSize.regular,
          backgroundColor: AppPallete.backgroundColor,
          foregroundColor: AppPallete.primaryWhite.level1,
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(Icons.close),
          fabSize: ExpandableFabSize.small,
          backgroundColor: AppPallete.backgroundColor,
          foregroundColor: AppPallete.primaryWhite.level1,
          shape: const CircleBorder(),
        ),
        children: [
          //Home

          FloatingActionButton(
            backgroundColor: AppPallete.backgroundColor,
            shape: const CircleBorder(),
            tooltip: 'Home',
            heroTag: 'home',
            onPressed: () {
              if (kIsWeb) {
                GoRouter.of(context).go(AppRouter.landing);
              } else {
                GoRouter.of(context).push(AppRouter.landing);
              }
            },
            child: Icon(Icons.home,
                color: AppPallete.primaryWhite.level1, size: 30),
          ),
          //About Us
          FloatingActionButton(
            backgroundColor: AppPallete.backgroundColor,
            shape: const CircleBorder(),
            tooltip: 'About us',
            heroTag: 'about',
            onPressed: () {
              if (kIsWeb) {
                GoRouter.of(context).go(AppRouter.aboutPage);
              } else {
                GoRouter.of(context).push(AppRouter.aboutPage);
              }
            },
            child: Icon(Icons.info,
                color: AppPallete.primaryWhite.level1, size: 30),
          ),
          // Join Us
          FloatingActionButton(
            backgroundColor: AppPallete.backgroundColor,
            shape: const CircleBorder(),
            tooltip: 'Join us',
            heroTag: 'join',
            onPressed: () async {
              var uri = Uri.parse("https://t.me/+SUuVpa4fIghmMWZl");
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                // can't launch url
              }
            },
            child: Icon(Icons.group,
                color: AppPallete.primaryWhite.level1, size: 30),
          ),
          // suggest
          FloatingActionButton(
            backgroundColor: AppPallete.backgroundColor,
            shape: const CircleBorder(),
            tooltip: 'Suggest',
            heroTag: 'suggest',
            onPressed: () async {
              var uri = Uri.parse("https://telegram.me/AttendifySuggestions");
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                // can't launch url
              }
            },
            child: Icon(Icons.lightbulb,
                color: AppPallete.primaryWhite.level1, size: 30),
          ),

          //Terms and Conditions
          FloatingActionButton(
            backgroundColor: AppPallete.backgroundColor,
            shape: const CircleBorder(),
            tooltip: 'Terms and Conditions',
            heroTag: 'terms',
            onPressed: () {
              if (kIsWeb) {
                GoRouter.of(context).go(AppRouter.termsAndConditions);
              } else {
                GoRouter.of(context).push(AppRouter.termsAndConditions);
              }
            },
            child: Icon(Icons.description,
                color: AppPallete.primaryWhite.level1, size: 30),
          ),
        ],
      );
    });
  }
}
