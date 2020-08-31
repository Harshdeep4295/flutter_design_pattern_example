import 'package:flutter_design_pattern_example/design_pattern/singleton/example_base_state.dart';

class ExampleStateWithoutSingleton extends ExampleStateBase {
  ExampleStateWithoutSingleton() {
    initialText =
        "A new 'ExampleStateWithoutSingleton' instance has been created.";
    stateText = initialText;
    print(stateText);
  }
}
