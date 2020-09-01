import 'package:flutter_design_pattern_example/design_pattern/facade/apis/camera_api.dart';
import 'package:flutter_design_pattern_example/design_pattern/facade/apis/playstation_api.dart';
import 'package:flutter_design_pattern_example/design_pattern/facade/smart_home_state.dart';

class GamingFacade {
  final PlaystationApi _playstationApi = PlaystationApi();
  final CameraApi _cameraApi = CameraApi();

  void startGaming(SmartHomeState smartHomeState) {
    smartHomeState.gamingConsoleOn = _playstationApi.turnOn();
  }

  void stopGaming(SmartHomeState smartHomeState) {
    smartHomeState.gamingConsoleOn = _playstationApi.turnOff();
  }

  void startStreaming(SmartHomeState smartHomeState) {
    smartHomeState.streamingCameraOn = _cameraApi.turnCameraOn();
    startGaming(smartHomeState);
  }

  void stopStreaming(SmartHomeState smartHomeState) {
    smartHomeState.streamingCameraOn = _cameraApi.turnCameraOff();
    stopGaming(smartHomeState);
  }
}
