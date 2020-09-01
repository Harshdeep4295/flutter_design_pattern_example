import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/istate.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/state_context.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/states/loading_state.dart';

// To display the No Result state
class NoResultsState implements IState {
  @override
  Future nextState(StateContext context) async {
    context.setState(LoadingState());
  }

  @override
  Widget render() {
    return Text(
      'No Results',
      style: TextStyle(fontSize: 24.0),
      textAlign: TextAlign.center,
    );
  }
}
