import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/apis/json_bmi_student.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/student.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/student_bmi_calculator.dart';

// This class represent the calculation to be done for student data.
// Here we are not using the do filter method, it will basically return the object as described in main class.
class StudentsJsonBmiCalculator extends StudentsBmiCalculator {
  final JsonStudentsApi _api = JsonStudentsApi();

  @override
  @protected
  List<Student> getStudentsData() {
    var studentsJson = _api.getStudentsJson();
    var studentsMap = json.decode(studentsJson) as Map<String, dynamic>;
    var studentsJsonList = studentsMap['students'] as List;
    var studentsList = studentsJsonList
        .map((json) => Student(
              fullName: json['fullName'],
              age: json['age'],
              height: json['height'],
              weight: json['weight'],
            ))
        .toList();

    return studentsList;
  }
}
