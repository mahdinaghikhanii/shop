import 'package:flutter/foundation.dart';

class BottomSheetProvider extends ChangeNotifier {
  bool _toggleIcon = true;

  toggleIconState() {
    _toggleIcon = !_toggleIcon;
    notifyListeners();
  }
}
