import 'package:flutter/material.dart';

const num DESIGN_WIDTH = 430;
const num DESIGN_HEIGHT = 932;
const num STATUS_BAR = 0;

extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;
  double get _height => SizeUtils.height;
  
  double get h => (this / DESIGN_HEIGHT) * _height;
  double get w => (this / DESIGN_WIDTH) * _width;
  double get fsize => (this / DESIGN_WIDTH) * _width;
}

extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}

enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

class CustomSizer extends StatelessWidget {
  const CustomSizer({
    Key? key,
    required this.builder,
  }) : super(key: key);
  
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeUtils.setScreenSize(constraints, orientation);
            return builder(context, orientation, SizeUtils.deviceType);
          },
        );
      },
    );
  }
}

class SizeUtils {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late double width;
  static late double height;
  static late DeviceType deviceType;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth.isNonZero(defaultValue: DESIGN_WIDTH);
      height = boxConstraints.maxHeight.isNonZero(defaultValue: DESIGN_HEIGHT);
    } else {
      width = boxConstraints.maxHeight.isNonZero(defaultValue: DESIGN_WIDTH);
      height = boxConstraints.maxWidth.isNonZero(defaultValue: DESIGN_HEIGHT);
    }

    // You may need to adjust this logic based on device dimensions
    if (width > 600) {
      deviceType = DeviceType.tablet;
    } else if (width > 1200) {
      deviceType = DeviceType.desktop;
    } else {
      deviceType = DeviceType.mobile;
    }
  }
}
