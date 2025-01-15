import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/chain_constants.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/image_constant.dart';
import '../../themes/custom_text_style.dart';
import '../../themes/theme_helper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form.dart';
import 'notifier/import_address_notifier.dart';

class ImportAddressScreen extends ConsumerStatefulWidget {
  const ImportAddressScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ImportAddressScreen> createState() =>
      ImportAddressScreenState();
}

class ImportAddressScreenState extends ConsumerState<ImportAddressScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(importAddressNotifier);
    final notifier = ref.read(importAddressNotifier.notifier);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.h,
                    vertical: 64.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(context),
                      SizedBox(height: 30.h),
                      _buildNameField(context),
                      SizedBox(height: 20.h),
                      _buildAddressFields(context),
                      if (state.error != null)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Text(
                            state.error!,
                            style: CustomTextStyles.bodySmallInterTightError,
                          ),
                        ),
                      SizedBox(height: 16.h),
                      _buildBalanceCheckButton(context),
                      SizedBox(height: 16.h),
                      _buildContinueButton(context),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgBack,
          height: 24.h,
          width: 26.h,
          onTap: () => Navigator.pop(context),
        ),
        SizedBox(height: 42.h),
        Text(
          "Import Address",
          style: theme.textTheme.headlineLarge,
        ),
        SizedBox(height: 8.h),
        Text(
          "Please enter the addresses you want to import",
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildNameField(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: CustomTextStyles.titleMediumBlack900,
          ),
          SizedBox(height: 6.h),
          Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                controller: ref.watch(importAddressNotifier).nameController,
                contentPadding: EdgeInsets.all(14.h),
                hintText: "Enter wallet name",
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddressFields(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(importAddressNotifier);

        return Column(
          children: ChainConstants.networkConfigs.entries.map((entry) {
            final chain = entry.key;
            final config = entry.value;
            final controller = state.addressControllers[chain];
            final error = state.validationMessages[chain];
            final balance = state.balances[chain];

            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${config.name} Address",
                    style: CustomTextStyles.titleMediumBlack900,
                  ),
                  SizedBox(height: 6.h),
                  CustomTextFormField(
                    controller: controller!,
                    contentPadding: EdgeInsets.all(14.h),
                    hintText: "Enter ${config.name} address",
                    errorText: error?.isNotEmpty == true ? error : null,
                    suffixText: balance != null
                        ? "${balance.toStringAsFixed(4)} ${config.symbol}"
                        : null,
                  ),
                  if (chain == ChainConstants.ethereum)
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text("ENS names supported (e.g., name.eth)",
                          style: CustomTextStyles.bodyMediumBlack900_1),
                    ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildBalanceCheckButton(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomElevatedButton(
          text: "Check Balances",
          margin: EdgeInsets.symmetric(horizontal: 12.h),
          onPressed: () =>
              ref.read(importAddressNotifier.notifier).checkBalances(),
        );
      },
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomElevatedButton(
          text: "Import Addresses",
          margin: EdgeInsets.symmetric(horizontal: 12.h),
          onPressed: () async {
            final success =
                await ref.read(importAddressNotifier.notifier).importAddress();
            if (success) {
              Navigator.pop(context);
            }
          },
        );
      },
    );
  }
}
