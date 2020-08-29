import 'package:flutter_design_pattern_example/design_pattern/singleton/example_base_state.dart';

class ExampleState extends ExampleStateBase {
  static final ExampleState _instance = ExampleState._internal();

  factory ExampleState() {
    return _instance;
  }

  ExampleState._internal() {
    initialText = "A new 'ExampleState' instance has been created.";
    stateText = initialText;
    print(stateText);
  }
}
