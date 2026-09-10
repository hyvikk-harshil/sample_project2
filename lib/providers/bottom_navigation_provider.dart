import 'package:flutter/cupertino.dart';

class BottomNavigationProvider extends ChangeNotifier{
  int currentIndex = 0;

  void Function(int)? onIndexChanged(int index){
    currentIndex = index;
    notifyListeners();
    return null;
  }

  void increment(){
     currentIndex++;
     notifyListeners();
  }

}