import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/navigator_service.dart';
import '../../themes/theme_helper.dart';
import '../../widgets/custom_currency.dart';
import '../../widgets/custom_image_view.dart';

class CashBalanceSetupScreen extends ConsumerStatefulWidget {
  const CashBalanceSetupScreen({super.key});

  @override
  CashBalanceSetupScreenState createState() => CashBalanceSetupScreenState();
}

class CashBalanceSetupScreenState extends ConsumerState<CashBalanceSetupScreen> {
  @override
  Widget build (BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 18.h,
            top: 58.h,
            right: 18.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowLeft,
                height: 24.h,
                width: 24.h,
                onTap: () {
                  onTapGoBack(context);
                },
              ),
              SizedBox(height: 66.h),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.h,
                      right: 12.h,
                    ),
                    child: Column(
                      children: [
                        _buildContentSection(context),
                        SizedBox(height: 88),
                        Center(
                          child: CurrencyInputWidget(
                            onChanged: (value) {
                              print('Current cash balance: \$${value.toStringAsFixed(2)}');
                            },
                          ),
                        ),
                        Spacer(),
                        CustomElevatedButton(
                          text: 'Continue',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        )
      )
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Text(
            'Setup your cash balance',
            style: theme.textTheme.headlineLarge,
          ),
          SizedBox(height: 4.h),
          Text(
            'We will suggest category amounts based on the categories you selected',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium!.copyWith(height: 1.57),
          ),
        ],
      ),
    );
  }
  onTapGoBack(BuildContext context) {
    NavigatorService.goBack();
  }
}