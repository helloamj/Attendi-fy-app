import 'dart:collection';
import 'dart:developer';

import 'package:animate_gradient/animate_gradient.dart';
import 'package:attendify/helper/on_paste_handler.dart';
import 'package:attendify/helper/router.dart';
import 'package:attendify/src/model/subject_model.dart';
import 'package:attendify/src/view/global_widgets.dart';
import 'package:attendify/theme/app_pallete.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_moving_background/enums/animation_types.dart';
import 'package:flutter_moving_background/flutter_moving_background.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as html;
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class InfoFeedPage extends StatefulWidget {
  const InfoFeedPage({super.key});

  @override
  State<InfoFeedPage> createState() => _InfoFeedPageState();
}

class _InfoFeedPageState extends State<InfoFeedPage> {
  late FToast fToast;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      fToast = FToast();
      fToast.init(context);
      if (kIsWeb) {
        html.window.onPopState.listen((_) {
          try {
            if (context.mounted && context.canPop()) {
              context.pop();
            }
          } catch (e) {
            log(e.toString());
          }
        });
      }
    });

    super.initState();
  }

  Widget imageDialog(path, context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: SizedBox.expand(
        child: Image.asset(
          '$path',
          fit: BoxFit.contain,
        ),
      ),
    );
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
        child: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth > 600 ? 600 : constraints.maxWidth,
              height: 400,
              child: WidgetAnimator(
                incomingEffect: WidgetTransitionEffects.incomingScaleUp(),
                child: Card(
                  color: Colors.white.withOpacity(0.7),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _infoBody(),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    ));
  }

  Center _infoBody() {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _inBoxWidget(context),
              ),
            ),
          )),
    );
  }

  Column _inBoxWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Paste Attendace Report',
            style: TextStyle(
                fontSize: 30,
                color: AppPallete.primaryWhite.level4,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: () async {
            context.loaderOverlay.show();
            bool valid = await OnPasteHandler.onPaste(context);
            if (!valid) {
              context.loaderOverlay.hide();
              fToast.showToast(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.red,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.close, color: Colors.white),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text("Invalid Attendance Report!"),
                    ],
                  ),
                ),
                gravity: ToastGravity.BOTTOM,
                toastDuration: const Duration(seconds: 2),
              );
              return;
            } else {
              context.loaderOverlay.hide();
            }
            if (context.mounted) {
              if (kIsWeb) {
                GoRouter.of(context).go(AppRouter.resultPage);
              } else {
                GoRouter.of(context).push(AppRouter.resultPage);
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              side:
                  BorderSide(color: AppPallete.primaryWhite.level4!, width: 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          iconAlignment: IconAlignment.end,
          icon: Icon(
            Icons.paste,
            color: AppPallete.primaryWhite.level4,
            size: 25.0,
          ),
          label: Text('Paste Here...',
              style: TextStyle(
                fontSize: 25,
                color: AppPallete.primaryWhite.level4,
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Step 1: Open your college ERP\nStep 2: Go to the attendance section\nStep 3: Click on the attendance report\nStep 4: Copy the report\nStep 5: Paste the report here\nStep 6: Done!",
                style: TextStyle(
                    color: AppPallete.primaryWhite.level4,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w200)),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () async {
                await showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) =>
                        imageDialog('assets/tutorial/tutorial.jpeg', context));
              },
              child: Row(
                children: [
                  AutoSizeText(
                      minFontSize: 12,
                      maxFontSize: 40,
                      "Click here if you still need help!",
                      style: TextStyle(
                          color: AppPallete.primaryWhite.level4,
                          fontSize: 12,
                          //underline
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          decorationColor: AppPallete.primaryWhite.level4!,
                          fontWeight: FontWeight.w200)),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
