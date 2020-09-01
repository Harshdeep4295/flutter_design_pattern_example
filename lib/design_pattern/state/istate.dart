import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/state_context.dart';

// This basic class which have two methods for each state
abstract class IState {
  Future nextState(StateContext context);
  Widget render();
}
