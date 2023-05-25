import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AvatarProvider with ChangeNotifier {
  String _photo = 'images/collarAvatar.jpg';

  String get photo => _photo;

  set photo(String newPhoto) {
    _photo = newPhoto;
    notifyListeners();
  }
}
