import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/apis/json_bmi_student.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/student.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/student_bmi_calculator.dart';

// This class represent the calculation to be done for teenage student data.
class TeenageStudentsJsonBmiCalculator extends StudentsBmiCalculator {
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

  // Here we are using the student filtering method as required.
  @override
  @protected
  List<Student> doStudentsFiltering(List<Student> studentList) {
    return studentList
        .where((student) => student.age > 12 && student.age < 20)
        .toList();
  }
}
