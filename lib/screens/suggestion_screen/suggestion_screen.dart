import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../themes/theme_helper.dart';

class SuggestionScreen extends ConsumerStatefulWidget {
  const SuggestionScreen({super.key});

  @override
  ConsumerState<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends ConsumerState<SuggestionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary.withOpacity(1),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 24.h,
            top: 58.h,
            right: 24.h,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowLeft,
                height: 24.h,
                width: 24.h,
                alignment: Alignment.center,
                onTap: () {
                  onTapGoBack(context);
                },
              ),
              SizedBox(height: 48.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Let's allocate some amount",
                  style: theme.textTheme.headlineLarge,
                ),
              ),
              SizedBox(height: 18.h),
              _buildAllocationSuggestions(context),
              SizedBox(height: 10.h),
              _buildCurrencyDisplayContext(context),
              SizedBox(height: 10.h),
              _buildShoppingList(context),
              SizedBox(height: 244.h),
              CustomElevatedButton(
                text: 'Finish',
                margin: EdgeInsets.symmetric(horizontal: 10.h),
              ),
              SizedBox(height: 30.h)
            ],
          ),
        )
      ),
    );
  }
}
