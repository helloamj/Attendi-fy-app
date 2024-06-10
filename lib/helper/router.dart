import 'package:attendify/src/view/info_feed_page/info_feed_page.dart';
import 'package:attendify/src/view/landing_page/landing_page.dart';
import 'package:attendify/src/view/others/about_us_page.dart';
import 'package:attendify/src/view/others/terms_and_conditions_page.dart';
import 'package:attendify/src/view/result_page/result_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AppRouter {
  static const landing = '/';
  static const infoFeed = '/upload-attendance';
  static const resultPage = '/attendance-result';
  static const aboutPage = '/about';
  static const termsAndConditions = '/terms-and-conditions';
  static GoRouter router = GoRouter(
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    routes: [
      GoRoute(
        path: landing,
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: infoFeed,
        builder: (context, state) =>
            const LoaderOverlay(useDefaultLoading: true, child: InfoFeedPage()),
      ),
      GoRoute(
          path: resultPage, builder: (context, state) => const ResultPage()),
      GoRoute(
          path: aboutPage, builder: (context, state) => const AboutUsPage()),
      GoRoute(
          path: termsAndConditions,
          builder: (context, state) => const TermsConditionsPage()),
    ],
  );
}
