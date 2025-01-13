import 'package:albus/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:albus/ui/import_address_screen/notifier/import_address_notifier.dart';

import '../../core/utils/image_constant.dart';
import '../../themes/custom_text_style.dart';
import '../../themes/theme_helper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form.dart';

class ImportAddressScreen extends ConsumerStatefulWidget {
  const ImportAddressScreen({super.key});

  @override
  ConsumerState<ImportAddressScreen> createState() =>
      ImportAddressScreenState();
}

class ImportAddressScreenState extends ConsumerState<ImportAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 22.h,
            vertical: 64.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgBack,
                height: 24.h,
                width: 26.h,
                onTap: () {},
              ),
              SizedBox(height: 42.h),
              Text(
                "Import Address",
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 8.h),
              Text("Please enter the address that you want to import",
                  style: theme.textTheme.bodyLarge),
              SizedBox(height: 30.h),
              _buildColumnName(context),
              SizedBox(height: 20.h),
              _buildColumnAddress(context),
              SizedBox(height: 36.h),
              SizedBox(
                width: 326.h,
                child: Text(
                  "Your nickname is locally stored on your device. It will only be visible to you",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodySmallInterTightBlack900,
                ),
              ),
              const Spacer(),
              CustomElevatedButton(
                text: "Continue",
                margin: EdgeInsets.symmetric(horizontal: 12.h),
                onPressed: () {},
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColumnName(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 4.h,
        right: 12.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: CustomTextStyles.titleMediumBlack900,
          ),
          SizedBox(height: 6.h),
          Consumer(
            builder: (context, ref, child) {
              return CustomTextFormField(
                controller: ref.watch(importAddressNotifier).nameController,
                contentPadding: EdgeInsets.all(14.h),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildColumnAddress(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 4.h,
        right: 12.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address",
            style: CustomTextStyles.titleMediumBlack900,
          ),
          SizedBox(height: 6.h),
          Consumer(
            builder: (context, ref, child) {
              final addressControllers =
                  ref.watch(importAddressNotifier).addressControllers;
              final defaultController = addressControllers.values.first;

              return CustomTextFormField(
                controller: defaultController,
                contentPadding: EdgeInsets.all(14.h),
              );
            },
          )
        ],
      ),
    );
  }
}
