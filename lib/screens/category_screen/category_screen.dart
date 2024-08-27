import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/size_utils.dart';
import '../../themes/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import '../../core/utils/image_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import 'notifiers/categories_notifier.dart';
import 'widget/suggested_item_widget.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
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
                  Navigator.pop(context);
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
                        _buildSuggestedViewSection(context, ref),
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
              SizedBox(height: 30.h)
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

  Widget _buildSuggestedViewSection(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(categoriesNotifier);
    final categoriesNotifierState = ref.read(categoriesNotifier.notifier);

    final suggestedItems =
        categoriesState.categoriesModelObj?.suggestedItems ?? [];

    return SizedBox(
      width: double.maxFinite,
      child: Wrap(
        runSpacing: 4.h,
        spacing: 4.h,
        children: suggestedItems.map((item) {
          return SuggestedItemWidget(
            item,
            onSelectedChipView: (value) {
              categoriesNotifierState.onSelectedChipView(item.id, value);
            },
          );
        }).toList(),
      ),
    );
  }
}
