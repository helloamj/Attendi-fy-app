import 'dart:math';
import 'dart:developer' as D;
import 'package:attendify/src/controller/result_page_provider.dart';
import 'package:attendify/src/model/subject_model.dart';
import 'package:attendify/src/view/global_widgets.dart';
import 'package:attendify/src/view/result_page/widget.dart';
import 'package:attendify/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_moving_background/enums/animation_types.dart';
import 'package:flutter_moving_background/flutter_moving_background.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<ResultsProvider>(context, listen: false).updateResult();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Provider.of<ResultsProvider>(context).subjects.isEmpty
            ? null
            : AppBar(
                elevation: 0,
                toolbarHeight: 100,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                actions: [
                  // Edit Percentage
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        _editDesiredPercent(context);
                      },
                      child: Icon(Icons.edit,
                          color: AppPallete.primaryWhite.level1, size: 30),
                    ),
                  ),
                ],
              ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: const PersistantFAB(),
        body: MovingBackground(
          animationType: AnimationType.translation,
          backgroundColor: AppPallete.backgroundColor,
          circles: const [
            MovingCircle(color: Colors.purple),
            MovingCircle(color: Colors.deepPurple),
            MovingCircle(color: Colors.orange),
            MovingCircle(color: Colors.orangeAccent),
            MovingCircle(color: Colors.white12),
          ],
          child: Consumer<ResultsProvider>(builder: (context, provider, child) {
            D.log(
                (provider.currentPercentage * 100 < provider.desiredPercentage)
                    .toString());
            if (provider.subjects.isEmpty) {
              return Center(
                child: Text(
                  'No Data Available',
                  style: TextStyle(
                      color: AppPallete.primaryWhite.level1,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              );
            }
            if (provider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SizedBox.expand(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: _view(),
                ),
              );
            }
          }),
        ));
  }

  Future<dynamic> _editDesiredPercent(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            width: min(30.w, 30.h),
            height: min(30.w, 30.h),
            child: AlertDialog(
              backgroundColor: AppPallete.backgroundColor,
              title: Text('Select Desired Percentage',
                  style: TextStyle(
                      color: AppPallete.primaryWhite.level1,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Provider.of<ResultsProvider>(context, listen: false)
                          .decrementDesiredPercentage();
                    },
                    child: Icon(
                      Icons.arrow_left,
                      size: 10.w,
                    ),
                  ),
                  Consumer<ResultsProvider>(
                      builder: (context, provider, child) {
                    return Text(
                      "${provider.desiredPercentage.toInt()}%",
                      style: TextStyle(
                          color: AppPallete.primaryWhite.level1,
                          fontSize: 15.w,
                          fontWeight: FontWeight.bold),
                    );
                  }),
                  InkWell(
                    onTap: () {
                      Provider.of<ResultsProvider>(context, listen: false)
                          .incrementDesiredPercentage();
                    },
                    child: Icon(
                      Icons.arrow_right,
                      size: 10.w,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _view() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10.h,
        ),
        WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
              duration: const Duration(seconds: 2)),
          child: SizedBox(
            width: min(90.h, 90.w),
            height: min(60.h, 60.w),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Consumer<ResultsProvider>(
                        builder: (context, provider, child) {
                      return LayoutBuilder(builder: (context, constraints) {
                        return TweenAnimationBuilder<double>(
                            tween: Tween<double>(
                                begin: 0.0, end: provider.currentPercentage),
                            duration: const Duration(milliseconds: 1000),
                            builder: (context, value, _) =>
                                CircularPercentIndicator(
                                  radius: constraints.maxWidth / 3,
                                  lineWidth: 10.0,
                                  percent: value,
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${(value * 100).toStringAsFixed(2)}%',
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.12,
                                            color:
                                                AppPallete.primaryWhite.level1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'CURRENT',
                                        style: TextStyle(
                                            color:
                                                AppPallete.primaryWhite.level2,
                                            fontSize:
                                                constraints.maxWidth * 0.10,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ],
                                  ),
                                  progressColor:
                                      provider.currentPercentage * 100 <
                                              provider.desiredPercentage
                                          ? AppPallete.primaryRed.level1
                                          : AppPallete.primaryGreen.level1,
                                ));
                      });
                    })),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Consumer<ResultsProvider>(
                        builder: (context, provider, child) {
                      return DecidedHoursWidget(
                        hours: provider.currentPercentage * 100 <
                                provider.desiredPercentage
                            ? provider.toTake
                            : provider.canLeave,
                        isToTake: provider.currentPercentage * 100 <
                            provider.desiredPercentage,
                      );
                    })),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Consumer<ResultsProvider>(
                      builder: (context, provider, child) {
                    return BasePercentWidget(
                      desiredPercentage: provider.desiredPercentage.toInt(),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(
                Provider.of<ResultsProvider>(context, listen: false)
                    .subjects
                    .length, (index) {
              return WidgetAnimator(
                  incomingEffect: index.isOdd
                      ? WidgetTransitionEffects.incomingSlideInFromLeft(
                          duration: const Duration(seconds: 2))
                      : WidgetTransitionEffects.incomingSlideInFromRight(
                          duration: const Duration(seconds: 2)),
                  child: _onBackgroundContainer(
                      index: index,
                      child: Consumer<ResultsProvider>(
                          builder: (context, provider, child) {
                        return _individualGridSubjectResult(
                            index, provider.subjects[index]);
                      })));
            }))
      ],
    );
  }

  Widget _individualGridSubjectResult(int index, SubjectModel subjectModel) {
    List<String> keys = [
      "Subject Name",
      "Subject Code",
      "Absent",
      "Present",
      "OD",
      subjectModel.toTake == 0 ? 'Can Leave' : 'To Take',
    ];
    List<String> values = [
      subjectModel.subject,
      subjectModel.subjectCode,
      subjectModel.absent.toString(),
      subjectModel.present.toString(),
      subjectModel.od.toString(),
      '${subjectModel.toTake == 0 ? subjectModel.canLeave : subjectModel.toTake}h',
    ];
    return LayoutBuilder(builder: (context, constraint) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: index.isOdd
            ? [
                const Spacer(),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(keys.length, (index) {
                      return Text(
                        keys[index],
                        style: TextStyle(
                            color: AppPallete.primaryWhite.level1,
                            fontSize: constraint.maxHeight * 0.09,
                            fontWeight: FontWeight.w400),
                      );
                    })),
                const Spacer(),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(keys.length, (index) {
                      return Text(
                        values[index],
                        style: TextStyle(
                            color: AppPallete.primaryWhite.level2,
                            fontSize: constraint.maxHeight * 0.09,
                            fontWeight: FontWeight.w200),
                      );
                    })),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AnimatedPercentProgress(
                    width: 18.h,
                    height: 18.h,
                    desiredPercentage:
                        Provider.of<ResultsProvider>(context, listen: false)
                            .desiredPercentage,
                    percentage: subjectModel.percentage,
                  ),
                )
              ]
            : [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AnimatedPercentProgress(
                    width: 18.h,
                    height: 18.h,
                    desiredPercentage:
                        Provider.of<ResultsProvider>(context, listen: false)
                            .desiredPercentage,
                    percentage: subjectModel.percentage,
                  ),
                ),
                const Spacer(),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(keys.length, (index) {
                      return Text(
                        keys[index],
                        style: TextStyle(
                            color: AppPallete.primaryWhite.level1,
                            fontSize: constraint.maxHeight * 0.09,
                            fontWeight: FontWeight.w400),
                      );
                    })),
                const Spacer(),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(keys.length, (index) {
                      return Text(
                        values[index],
                        style: TextStyle(
                            color: AppPallete.primaryWhite.level2,
                            fontSize: constraint.maxHeight * 0.09,
                            fontWeight: FontWeight.w200),
                      );
                    })),
                const Spacer(),
              ],
      );
    });
  }

  Container _onBackgroundContainer({Widget? child, required int index}) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: min(500, MediaQuery.of(context).size.width),
      height: 20.h,
      decoration: BoxDecoration(
          color: AppPallete.onBackground,
          borderRadius: index.isEven
              ? const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )),
      child: child,
    );
  }
}
