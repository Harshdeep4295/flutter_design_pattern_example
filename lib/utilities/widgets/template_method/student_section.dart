import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/student.dart';
import 'package:flutter_design_pattern_example/design_pattern/template_method/student_bmi_calculator.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/platform_button.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/template_method/template_student_data_table.dart';

class StudentsSection extends StatefulWidget {
  final StudentsBmiCalculator bmiCalculator;
  final String headerText;

  const StudentsSection({
    @required this.bmiCalculator,
    @required this.headerText,
  })  : assert(bmiCalculator != null),
        assert(headerText != null);

  @override
  _StudentsSectionState createState() => _StudentsSectionState();
}

class _StudentsSectionState extends State<StudentsSection> {
  final List<Student> students = List<Student>();

  void _calculateBmiAndGetStudentsData() {
    setState(() {
      students.addAll(widget.bmiCalculator.calculateBmiAndReturnStudentList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.headerText),
        const SizedBox(height: spaceM),
        Stack(
          children: <Widget>[
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: students.length > 0 ? 1.0 : 0.0,
              child: StudentsDataTable(
                students: students,
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: students.length == 0 ? 1.0 : 0.0,
              child: PlatformButton(
                child: Text('Calculate BMI and get students\' data'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _calculateBmiAndGetStudentsData,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
