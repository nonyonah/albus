import 'package:flutter/material.dart';

const num deviceWidth = 430;
const num deviceHeight = 932;
const num statusBar = 0;

class SizeUtils {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation;
  static late DeviceType deviceType;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    deviceType = _getDeviceType();
  }

  static DeviceType _getDeviceType() {
    if (screenWidth > 600) {
      return DeviceType.tablet;
    } else if (screenWidth > 1200) {
      return DeviceType.desktop;
    } else {
      return DeviceType.mobile;
    }
  }
}

extension ResponsiveExtension on num {
  double get h => (this / deviceHeight) * SizeUtils.screenHeight;
  double get w => (this / deviceWidth) * SizeUtils.screenWidth;
  double get v => (this / (deviceHeight - statusBar)) * (SizeUtils.screenHeight - SizeUtils._mediaQueryData.padding.top);

  double get adaptSize {
    var height = v;
    var width = w;
    return height < width ? height : width;
  }

  double get fSize => adaptSize;
}

enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

class Sizer extends StatelessWidget {
  final ResponsiveBuild builder;

  const Sizer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    SizeUtils.init(context);
    return builder(
      context,
      SizeUtils.orientation,
      SizeUtils.deviceType,
    );
  }
}