import 'package:albus/core/utils/size_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../core/utils/image_constant.dart';
import '../../themes/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import 'initiliazation/categories_initialization.dart';

class CategoryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(categoriesNotifier);
    final notifier = ref.read(categoriesNotifier.notifier);
    
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's choose some categories",
                          style: theme.textTheme.headlineLarge,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Here are some suggestions for you (you can always add, edit or remove these later)',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            height: 1.57,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildCategoryScreen(
                                  "Food & Drink",
                                  categoriesState.categoriesModelObj.suggestion1ItemList,
                                  (index, value) => notifier.onSelectedChipView(index, value),
                                ),
                              ],
                            )
                          )
                        )
                      ]
                    )
                  )
                ),
              )
            ]
          ),
        )
      )
    )
  }

 
}
