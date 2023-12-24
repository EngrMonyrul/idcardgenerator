import 'package:flutter/foundation.dart';

class HomePageProvider extends ChangeNotifier {
  String _frontPart = '';
  String _backPart = '';
  String _idCardImg = '';
  List<String> _idCardImgs = [];

  String get frontPart => _frontPart;

  String get backPart => _backPart;

  List<String> get idCardImgs => _idCardImgs;

  String get idCardImg => _idCardImg;

  void setFrontPart({required String imgPath}) {
    _frontPart = imgPath;
    notifyListeners();
  }

  void setBackPart({required String imgPath}) {
    _backPart = imgPath;
    notifyListeners();
  }

  void setIDCardImg({required String imgPath}) {
    _idCardImg = imgPath;
    _idCardImgs.add(imgPath);
    notifyListeners();
  }
}
