import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/screens/category_screen/models/suggested_item.dart';
import 'package:albus/screens/category_screen/notifiers/categories_notifier.dart';
import 'package:albus/screens/category_screen/widget/suggested_item_widget.dart';
import 'package:albus/widgets/custom_elevated_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../core/utils/image_constant.dart';
import '../../themes/theme_helper.dart';
import '../../widgets/custom_image_view.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  CategoriesScreenState createState() => CategoriesScreenState();
}

class CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 18.h,
            top: 50.h,
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
              SizedBox(height: 72.h),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      right: 24.h,
                    ),
                    child: Column(
                      children: [
                        _buildTitleSection(context),
                        SizedBox(height: 34.h),
                        _buildSuggestedViewSection(context),
                        Spacer(),
                        CustomElevatedButton(
                          text: 'Continue',
                          margin: EdgeInsets.only(left: 14.h),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's choose some categories",
            style: theme.textTheme.headlineLarge,
          ),
          SizedBox(height: 8.h),
          Text(
            "Here are some suggestions for you (you can add, edit or remove these later)",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium!.copyWith(height: 1.57),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedViewSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Consumer(
        builder: (context, ref, _) {
          final categoriesState = ref.watch(categoriesNotifier);
          final categoriesNotifierState = ref.read(categoriesNotifier.notifier);

          // Combine all chips into one list to avoid duplication
          final List<Widget> allChips = [
            // SuggestedItemModel chips (e.g., Groceries)
            ...List.generate(
              categoriesState.categoriesModelObj?.suggestedItemList.length ?? 0,
              (index) {
                return SuggestedItemWidget(
                  categoriesState.categoriesModelObj!.suggestedItemList[index],
                  onSelectedChipView: (value) {
                    categoriesNotifierState.onSelectedChipView(index, value);
                  },
                );
              },
            ),
            // Suggested2ItemModel chips (e.g., Restaurants)
            ...List.generate(
              categoriesState.categoriesModelObj?.suggestedItemList2.length ??
                  0,
              (index) {
                return Suggested2ItemWidget(
                  categoriesState.categoriesModelObj!.suggestedItemList2[index],
                  onSelectedChipView: (value) {
                    categoriesNotifierState.onSelectedChipView2(index, value);
                  },
                );
              },
            ),
            // Suggested3ItemModel chips (e.g., Repairs)
            ...List.generate(
              categoriesState.categoriesModelObj?.suggestedItemList3.length ??
                  0,
              (index) {
                return Suggested3ItemWidget(
                  categoriesState.categoriesModelObj!.suggestedItemList3[index],
                  onSelectedChipView: (value) {
                    categoriesNotifierState.onSelectedChipView3(index, value);
                  },
                );
              },
            ),
            // Suggested4ItemModel chips (e.g., Subscriptions)
            ...List.generate(
              categoriesState.categoriesModelObj?.suggestedItemList4.length ??
                  0,
              (index) {
                return Suggested4ItemWidget(
                  categoriesState.categoriesModelObj!.suggestedItemList4[index],
                  onSelectedChipView: (value) {
                    categoriesNotifierState.onSelectedChipView4(index, value);
                  },
                );
              },
            ),
            // Suggested5ItemModel chips (e.g., Transportation)
            ...List.generate(
              categoriesState.categoriesModelObj?.suggestedItemList5.length ??
                  0,
              (index) {
                return Suggested5ItemWidget(
                  categoriesState.categoriesModelObj!.suggestedItemList5[index],
                  onSelectedChipView: (value) {
                    categoriesNotifierState.onSelectedChipView5(index, value);
                  },
                );
              },
            ),
            // Suggested6ItemModel chips (e.g., Clothing)
            ...List.generate(
              categoriesState.categoriesModelObj?.suggestedItemList6.length ??
                  0,
              (index) {
                return Suggested6ItemWidget(
                  categoriesState.categoriesModelObj!.suggestedItemList6[index],
                  onSelectedChipView: (value) {
                    categoriesNotifierState.onSelectedChipView6(index, value);
                  },
                );
              },
            ),
            // Suggested7ItemModel chips (e.g., Electricity)
            ...List.generate(
              categoriesState.categoriesModelObj?.suggestedItemList7.length ??
                  0,
              (index) {
                return Suggested7ItemWidget(
                  categoriesState.categoriesModelObj!.suggestedItemList7[index],
                  onSelectedChipView: (value) {
                    categoriesNotifierState.onSelectedChipView7(index, value);
                  },
                );
              },
            ),
          ];

          return Wrap(
            runSpacing: 4.h,
            spacing: 4.h,
            children: allChips,
          );
        },
      ),
    );
  }

  void onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }
}
