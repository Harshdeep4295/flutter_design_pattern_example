import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/istate.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/state_context.dart';
import 'package:flutter_design_pattern_example/design_pattern/state/states/no_results_state.dart';
import 'package:flutter_design_pattern_example/utilities/app_constants.dart';
import 'package:flutter_design_pattern_example/utilities/widgets/platform_button.dart';

class StateExample extends StatefulWidget {
  @override
  _StateExampleState createState() => _StateExampleState();
}

class _StateExampleState extends State<StateExample> {
  var _stateContext = StateContext();

  Future<void> _changeState() async {
    await _stateContext.nextState();
  }

  @override
  void dispose() {
    _stateContext.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          children: <Widget>[
            PlatformButton(
              child: Text('Load names'),
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeState,
            ),
            const SizedBox(height: spaceL),
            StreamBuilder(
              initialData: NoResultsState(),
              stream: _stateContext.outState,
              builder: (_, AsyncSnapshot<IState> snapshot) =>
                  snapshot.data.render(),
            ),
          ],
        ),
      ),
    );
  }
}
