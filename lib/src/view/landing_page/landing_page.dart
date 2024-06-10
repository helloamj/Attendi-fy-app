import 'package:animate_gradient/animate_gradient.dart';
import 'package:attendify/helper/router.dart';
import 'package:attendify/src/view/global_widgets.dart';
import 'package:attendify/theme/app_pallete.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_moving_background/enums/animation_types.dart';
import 'package:flutter_moving_background/flutter_moving_background.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
          return constraints.maxWidth < 600
              ? SingleChildScrollView(child: _mobileLandingWidget(constraints))
              : _pcLandingWidget(constraints);
        }),
      ),
    ));
  }

  Row _pcLandingWidget(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: constraints.maxWidth * 0.4,
          child: _welcomeMessage(),
        ),
        _animation(constraints),
      ],
    );
  }

  WidgetAnimator _animation(BoxConstraints constraints) {
    return WidgetAnimator(
      incomingEffect: WidgetTransitionEffects.incomingSlideInFromRight(
        duration: const Duration(seconds: 1),
      ),
      atRestEffect: WidgetRestingEffects.wave(),
      child: Lottie.asset(
        'assets/animations/lottie/attendify_lp_animation.json',
        height: constraints.maxWidth * 0.5,
        width: constraints.maxWidth * 0.5,
      ),
    );
  }

  Column _mobileLandingWidget(BoxConstraints constraints) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: constraints.maxWidth * 0.2),
          child: _welcomeMessage(),
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _animation(constraints),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  WidgetAnimator _welcomeMessage() {
    return WidgetAnimator(
      incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
        duration: const Duration(seconds: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const AutoSizeText(
            'Welcome to Attendify!',
            maxLines: 2,
            minFontSize: 50,
            maxFontSize: 100,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const AutoSizeText(
            "Is attendance tracking giving you headaches? Don't worry, we've got a comprehensive solution to tackle this issue! Our innovative system streamlines the process, ensuring accurate and efficient attendance management. Say goodbye to manual errors and tedious tasks. With our solution, you can enjoy seamless and hassle-free attendance tracking, allowing you to focus on what truly matters.",
            maxLines: 5,
            minFontSize: 20,
            maxFontSize: 50,
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (kIsWeb) {
                GoRouter.of(context).go(AppRouter.infoFeed);
              } else {
                GoRouter.of(context).push(AppRouter.infoFeed);
              }
            },
            style: ElevatedButton.styleFrom(
                shadowColor: AppPallete.primaryWhite.level4!.withOpacity(0.5)),
            iconAlignment: IconAlignment.end,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: AppPallete.primaryWhite.level4,
              size: 20.0,
            ),
            label: Text('Get Started',
                style: TextStyle(
                  fontSize: 20,
                  color: AppPallete.primaryWhite.level4,
                )),
          ),
        ],
      ),
    );
  }
}
