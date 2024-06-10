import 'dart:math';

import 'package:attendify/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BasePercentWidget extends StatelessWidget {
  final int? desiredPercentage;
  const BasePercentWidget({
    super.key,
    required this.desiredPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "$desiredPercentage%",
          style: TextStyle(
              color: AppPallete.primaryWhite.level1,
              fontSize: min(5.w, 5.h),
              height: 0,
              fontWeight: FontWeight.bold),
        ),
        Text("DESIRED",
            style: TextStyle(
                color: AppPallete.primaryWhite.level2,
                fontSize: min(4.w, 4.h),
                fontWeight: FontWeight.w200))
      ],
    );
  }
}

class DecidedHoursWidget extends StatelessWidget {
  final int hours;
  final bool isToTake;
  const DecidedHoursWidget({
    super.key,
    required this.hours,
    required this.isToTake,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${hours}h",
          style: TextStyle(
              color: AppPallete.primaryWhite.level1,
              fontSize: min(5.h, 5.w),
              height: 0,
              fontWeight: FontWeight.bold),
        ),
        Text(isToTake ? "TO TAKE" : "CAN LEAVE",
            style: TextStyle(
                color: AppPallete.primaryWhite.level2,
                fontSize: min(4.h, 4.w),
                fontWeight: FontWeight.w200))
      ],
    );
  }
}

class AnimatedPercentProgress extends StatelessWidget {
  final double? width;
  final double? height;
  final double? percentage;
  final double? desiredPercentage;
  const AnimatedPercentProgress({
    this.percentage = 0,
    this.width,
    this.height,
    this.desiredPercentage = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: width ?? min(50.h, 50.w),
        height: height ?? min(50.h, 50.w),
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: (percentage ?? 10) / 100),
          duration: const Duration(milliseconds: 1000),
          builder: (context, value, _) => Stack(
            children: [
              Positioned.fill(
                child: CircularProgressIndicator(
                  value: value,
                  strokeWidth: 8,
                  strokeCap: StrokeCap.round,
                  backgroundColor: AppPallete.primaryWhite.level2,
                  valueColor: desiredPercentage! <= percentage!
                      ? AlwaysStoppedAnimation<Color>(
                          AppPallete.primaryGreen.level1)
                      : AlwaysStoppedAnimation<Color>(
                          AppPallete.primaryRed.level1),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${(value * 100).toStringAsFixed(2)}%',
                      style: TextStyle(
                          color: AppPallete.primaryWhite.level1,
                          fontSize: constraints.maxHeight * 0.12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'CURRENT',
                      style: TextStyle(
                          color: AppPallete.primaryWhite.level2,
                          fontSize: constraints.maxHeight * 0.10,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
