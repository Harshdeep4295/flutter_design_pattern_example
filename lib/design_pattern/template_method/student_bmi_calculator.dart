import 'dart:math' as math;

import 'package:flutter_design_pattern_example/design_pattern/template_method/student.dart';
import 'package:meta/meta.dart';

// This base class is used to define the basic steps/functions to work with algorithm
abstract class StudentsBmiCalculator {
  List<Student> calculateBmiAndReturnStudentList() {
    var studentList = getStudentsData();
    studentList = doStudentsFiltering(studentList);
    _calculateStudentsBmi(studentList);
    return studentList;
  }

  void _calculateStudentsBmi(List<Student> studentList) {
    for (var student in studentList) {
      student.bmi = _calculateBmi(student.height, student.weight);
    }
  }

  double _calculateBmi(double height, int weight) {
    return weight / math.pow(height, 2);
  }

  // Hook methods - this method is can be overriden if needed to make some changes else it will
  // return the object as described below.
  @protected
  List<Student> doStudentsFiltering(List<Student> studentList) {
    return studentList;
  }

  // Abstract methods
  @protected
  List<Student> getStudentsData();
}
