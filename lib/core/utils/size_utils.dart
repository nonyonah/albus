import 'dart:ui';
import 'package:flutter/material.dart';

const num deviceWidth = 430;
const num deviceHeight = 932;
const num statusBar = 0;

extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;
  double get _height => SizeUtils.height;
  double get h => ((this * _width) / deviceWidth);
  double get v => ((this * _height) / (deviceHeight - statusBar));

  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDouble(): width.toDouble();
  }
  
  double get fSize => adaptSize;
}

extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this: defaultValue.toDouble();
  }
}

enum DeviceType {mobile, tablet, desktop}

typedef ResponsiveBuild = Widget Function(
  BuildContext context, Orientation orientation, DeviceType deviceType);

class Sizer extends StatelessWidget {
  const Sizer({super.key, required this.builder});
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

class SizeUtils{
  static late BoxConstraints boxConstraints;

  static late Orientation orientation;

  static late DeviceType deviceType;

  static late double height;

  static late double width;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;
    if (orientation == Orientation.portrait) {
      width = 
      boxConstraints.maxWidth.isNonZero(defaultValue: deviceWidth);
      height = boxConstraints.maxHeight.isNonZero();
    } else {
      width = 
      boxConstraints.maxHeight.isNonZero(defaultValue: deviceWidth);
      height = boxConstraints.maxWidth.isNonZero();
    }
    deviceType = DeviceType.mobile;
    }
  }