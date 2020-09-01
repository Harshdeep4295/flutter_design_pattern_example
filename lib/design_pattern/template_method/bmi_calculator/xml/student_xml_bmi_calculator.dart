import 'package:flutter_design_pattern_example/design_pattern/template_method/apis/xml_bmi_student.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/student.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/student_bmi_calculator.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart' as xml;

// Here we are not using the do filter method, it will basically return the object as described in main class.
class StudentsXmlBmiCalculator extends StudentsBmiCalculator {
  final XmlStudentsApi _api = XmlStudentsApi();

  @override
  @protected
  List<Student> getStudentsData() {
    var studentsXml = _api.getStudentsXml();
    var xmlDocument = xml.parse(studentsXml);
    var studentsList = List<Student>();

    for (var xmlElement in xmlDocument.findAllElements('student')) {
      var fullName = xmlElement.findElements('fullname').single.text;
      var age = int.parse(xmlElement.findElements('age').single.text);
      var height = double.parse(xmlElement.findElements('height').single.text);
      var weight = int.parse(xmlElement.findElements('weight').single.text);

      studentsList.add(Student(
        fullName: fullName,
        age: age,
        height: height,
        weight: weight,
      ));
    }

    return studentsList;
  }
}
