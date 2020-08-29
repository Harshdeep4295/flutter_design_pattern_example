import 'package:flutter_design_pattern_example/design_pattern/singleton/example_base_state.dart';

class ExampleStateByDefinition extends ExampleStateBase {
  static ExampleStateByDefinition _instance;

  ExampleStateByDefinition._internal() {
    initialText = "A new 'ExampleStateByDefinition' instance has been created.";
    stateText = initialText;
    print(stateText);
  }

  static ExampleStateByDefinition getState() {
    if (_instance == null) {
      _instance = ExampleStateByDefinition._internal();
    }

    return _instance;
  }
}
