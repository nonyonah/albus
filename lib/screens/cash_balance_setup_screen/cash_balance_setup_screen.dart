import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/gemini_allocation_provider.dart';
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

class CashBalanceSetupScreenState
    extends ConsumerState<CashBalanceSetupScreen> {
  @override
  Widget build(BuildContext context) {
    final allocations = ref.watch(allocationsProvider);
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
                    const SizedBox(height: 88),
                    Center(
                      child: CurrencyInputWidget(
                        onChanged: (value) {
                          print(
                              'Current cash balance: \$${value.toStringAsFixed(2)}');
                        },
                      ),
                    ),
                    const Spacer(),
                    CustomElevatedButton(
                      onPressed: () {
                        _updateAllocations(ref.read(amountProvider));
                      },
                      text: 'Continue',
                    ),
                    if (allocations.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Text('AI Allocations:',
                          style: theme.textTheme.headlineSmall),
                      Expanded(
                        child: ListView(
                          children: [
                            for (var entry
                                in allocations['Gemini']?.entries ?? [])
                              ListTile(),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    )));
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
            'How much cash do you have in your physical wallet? We will also suggest category amounts based on the categories you selected',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium!.copyWith(height: 1.57),
          ),
        ],
      ),
    );
  }

  void _updateAllocations(double amount) async {
    try {
      final geminiAllocation =
          await ref.read(geminiAllocationProvider(amount).future);
      ref.read(allocationsProvider.notifier).update((state) => {
            ...state,
            'Gemini': geminiAllocation,
          });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching allocations: $e')),
      );
    }
  }

  onTapGoBack(BuildContext context) {
    NavigatorService.goBack();
  }
}
