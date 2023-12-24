import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

class CameraPageProvider extends ChangeNotifier {
  int _cameraNumber = 0;
  bool _cameraFlash = false;

  bool get cameraFlash => _cameraFlash;

  int get cameraNumber => _cameraNumber;

  void setCameraFlash() {
    if (_cameraFlash) {
      _cameraFlash = false;
    } else {
      _cameraFlash = true;
    }
    notifyListeners();
  }

  void setCameraNumber() {
    if (_cameraNumber == 0) {
      _cameraNumber = 1;
    } else {
      _cameraNumber = 0;
    }
    notifyListeners();
  }
}
