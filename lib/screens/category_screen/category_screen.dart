import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/screens/category_screen/models/categories_model.dart';
import 'package:albus/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/image_constant.dart';
import '../../themes/theme_helper.dart';
import 'initiliazation/categories_initialization.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends ConsumerState<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 26.h,
            vertical: 54.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowLeft,
                height: 24.h,
                width: 24.h,
              ),
              SizedBox(
                height: 70.h,
              ),
              _buildChooseCategoriesSection(context),
              SizedBox(
                height: 30.h,
              ),
              //_buildFoodDrinkSection(context),
              // SizedBox(height: 30.h,),
              // _buildTransportationSection(context),
              // SizedBox(height: 30.h,),
              // _buildEntertainmentRecreationSection(context),
              // SizedBox(height: 30.h,)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildChooseCategoriesSection(BuildContext context) {
  return Container(
    width: double.maxFinite,
    padding: EdgeInsets.symmetric(horizontal: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's choose some categories",
          style: theme.textTheme.headlineLarge,
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          'Here are some suggestions for you(you can add, edit or remove this later)',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium!.copyWith(
            height: 1.57,
          ),
        )
      ],
    ),
  );
}

