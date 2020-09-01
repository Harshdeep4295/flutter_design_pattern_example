import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/bmi_calculator/json/student_json_bmi_calculator.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/bmi_calculator/json/student_teenage_json_bmi_calculator.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/bmi_calculator/xml/student_xml_bmi_calculator.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/template_method/student_section.dart';

class TemplateMethodExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StudentsSection(
              bmiCalculator: StudentsXmlBmiCalculator(),
              headerText: 'Students from XML data source:',
            ),
            const SizedBox(height: spaceL),
            StudentsSection(
              bmiCalculator: StudentsJsonBmiCalculator(),
              headerText: 'Students from JSON data source:',
            ),
            const SizedBox(height: spaceL),
            StudentsSection(
              bmiCalculator: TeenageStudentsJsonBmiCalculator(),
              headerText: 'Students from JSON data source (teenagers only):',
            ),
          ],
        ),
      ),
    );
  }
}
