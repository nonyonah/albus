import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/themes/app_decoration.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:flutter/material.dart';

import '../../../themes/theme_helper.dart';
import '../models/button_list_item.dart';

// ignore: must_be_immutable
class ButtonListItemWidget extends StatelessWidget {
  ButtonListItemWidget(this.buttonListItemModelObj,
      {super.key, this.onTapOptions});

  ButtonListItemModel buttonListItemModelObj;
  VoidCallback? onTapOptions;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapOptions?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 15.h,
        ),
        decoration: AppDecoration.fillBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          children: [
            Text(buttonListItemModelObj.emoji),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                buttonListItemModelObj.name,
                style: theme.textTheme.titleSmall,
              ),
            ),
            const Spacer(
              flex: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Text(
                  buttonListItemModelObj.frequency,
                  style: theme.textTheme.titleSmall,
                ),
              ),
            ),
            const Spacer(flex: 50),
            Container(
              margin: EdgeInsets.only(right: 8.h),
              padding: EdgeInsets.symmetric(horizontal: 14.h),
              decoration: AppDecoration.fillLightBlue.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder8,
              ),
              child: Text(
                buttonListItemModelObj.price,
                textAlign: TextAlign.center,
                style: CustomTextStyles.labelLargeOnPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
