import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCourseController extends GetxController {
  int selectedValue = 1;
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseDescriptionController = TextEditingController();
  TextEditingController courseFieldController = TextEditingController();
  TextEditingController courseLevelController = TextEditingController();
  TextEditingController coursePriceController = TextEditingController();

  void handleRadioValueChange(int? value) {
    selectedValue = value!;
    value == 1
        ? courseLevelController.text = 'Beginner'
        : value == 2
            ? courseLevelController.text = 'Mediate'
            : courseLevelController.text = 'Advanced';

    debugPrint(courseLevelController.text);
    update();
  }

  String dropdownvalue = 'Ui Ux Design';

  var courseFieldsList = [
    'Ui Ux Design',
    'Web Development',
    'Mobile Development',
    'Cyber Security',
    'Digital Marketing',
    'Machine Learning',
    'Data Science',
    'Big Data',
    'System Analysis',
    'Data Base',
  ];
}
