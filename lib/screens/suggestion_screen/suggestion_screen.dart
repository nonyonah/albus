import 'package:albus/core/utils/image_constant.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/screens/suggestion_screen/models/button_list_item.dart';
import 'package:albus/screens/suggestion_screen/widget/button_list_item_widget.dart';
import 'package:albus/themes/app_decoration.dart';
import 'package:albus/themes/custom_button_style.dart';
import 'package:albus/themes/custom_text_style.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../themes/theme_helper.dart';
import '../../widgets/custom_currency.dart';
import 'notifier/currency_notifier.dart';
import 'notifier/suggestion_notifier.dart';

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
        body: Padding(
          padding: EdgeInsets.only(
            left: 18.h,
            top: 50.h,
            right: 18.h,
          ),
          child: Column(
            children: [
              _buildBackButton(context),
              SizedBox(height: 48.h),
              _buildTitle(),
              SizedBox(height: 10.h),
              _buildAllocationSuggestions(context),
              SizedBox(height: 10.h),
              _buildCurrencyDisplayContext(context),
              SizedBox(height: 10.h),
              _buildShoppingList(context, ref),
              const Spacer(),
              _buildFinishButton(context),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgArrowLeft,
      height: 24.h,
      width: 24.h,
      alignment: Alignment.centerLeft,
      onTap: () {
        _onTapGoBack(context);
      },
    );
  }

  Widget _buildTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Let's allocate some amount",
        style: theme.textTheme.headlineLarge,
      ),
    );
  }

  Widget _buildAllocationSuggestions(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(25.h),
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.h),
          Text(
            "Not sure how much you want to allocate to each category?. We can help with some suggestions based on your income.",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.labelLarge13.copyWith(height: 1.69),
          ),
          SizedBox(height: 7.h),
          _buildSuggestAmountButton(),
        ],
      ),
    );
  }

  Widget _buildSuggestAmountButton() {
    return CustomElevatedButton(
      height: 22.h,
      width: 92.h,
      text: 'Suggest amount',
      buttonStyle: CustomButtonStyles.fillPrimaryTL10,
      buttonTextStyle: theme.textTheme.bodySmall,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 1000.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  children: [
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
                    const CustomElevatedButton(
                      text: 'Continue',
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCurrencyDisplayContext(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final currencyState = ref.watch(currencyProvider);
        return SizedBox(
          width: double.maxFinite,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return _buildCurrencySelectionGrid(context, ref);
                },
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 15.h,
              ),
              decoration: AppDecoration.fillBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.h),
                      child: Text(
                        'Current Currency',
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.h),
                    child: Text(
                      currencyState.selectedCurrency.amountCard ?? 'USD',
                      style: CustomTextStyles.labelLargeBlack900,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCurrencySelectionGrid(BuildContext context, WidgetRef ref) {
    final currencyState = ref.watch(currencyProvider);
    return Container(
      padding: EdgeInsets.all(16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Currency',
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 30.h),
          Expanded(
            child: GridView.builder(
              itemCount: currencyState.currencies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.h,
                mainAxisExtent: 51.h,
              ),
              itemBuilder: (context, index) {
                final currency = currencyState.currencies[index];
                final isSelected = currency.amountCard ==
                    currencyState.selectedCurrency.amountCard;
                return InkWell(
                  onTap: () {
                    ref
                        .read(currencyProvider.notifier)
                        .selectCurrency(currency);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.h),
                    decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                      color: isSelected ? theme.colorScheme.primary : null,
                    ),
                    child: Center(
                      child: Text(
                        currency.amountCard ?? '',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShoppingList(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        final suggestionModel =
            ref.watch(suggestionNotifier).suggestionModelObj;

        return ListView.separated(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemCount: suggestionModel?.buttonListItem.length ?? 0,
          itemBuilder: (context, index) {
            final model =
                suggestionModel?.buttonListItem[index] ?? ButtonListItemModel();
            return ButtonListItemWidget(
              model,
              onTapOptions: () {
                // Action on tap
              },
            );
          },
        );
      },
    );
  }

  Widget _buildFinishButton(BuildContext context) {
    return CustomElevatedButton(
      text: 'Finish',
      margin: EdgeInsets.symmetric(horizontal: 10.h),
    );
  }

  void _onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }
}
