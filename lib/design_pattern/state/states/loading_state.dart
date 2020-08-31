import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/istate.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/state_context.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/states/error_state.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/fake_api.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/states/loaded_state.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/states/no_results_state.dart';

// To display the loading state
class LoadingState implements IState {
  final FakeApi _api = FakeApi();

  @override
  Future nextState(StateContext context) async {
    try {
      var resultList = await _api.getNames();

      if (resultList.isEmpty) {
        context.setState(NoResultsState());
      } else {
        context.setState(LoadedState(resultList));
      }
    } on Exception {
      context.setState(ErrorState());
    }
  }

  @override
  Widget render() {
    return CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black,
      ),
    );
  }
}
