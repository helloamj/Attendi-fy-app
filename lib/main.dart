import 'package:attendify/helper/exeption_handler.dart';
import 'package:attendify/helper/provider_helper.dart';
import 'package:attendify/helper/router.dart';
import 'package:attendify/src/view/landing_page/landing_page.dart';
import 'package:attendify/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).catchError((e) {
    print(e);
  });

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  setPathUrlStrategy();
  runApp(MyApp(analytics: analytics));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.analytics});
  final FirebaseAnalytics analytics;
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: ProviderHelper.providers,
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          title: 'Attendify',

          // navigatorObservers: [
          //   FirebaseAnalyticsObserver(analytics: analytics),
          // ],
          debugShowCheckedModeBanner: false,
          theme: AppTheme.instance,
          // home: LandingPage(),
        ),
      );
    });
  }
}
