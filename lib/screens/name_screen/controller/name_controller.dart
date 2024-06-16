import 'package:flutter/material.dart';
import 'package:albus/screens/name_screen/models/name_models.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:get/get.dart';

class NameController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberInputController = TextEditingController();

  Rx<NameModel> nameModelsObj = NameModel().obs;
  Rx<Country> selectedCountry = 
    CountryPickerUtils.getCountryByPhoneCode('234').obs;
}