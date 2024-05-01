import 'dart:math';

import 'package:domus/provider/base_model.dart';
import 'package:domus/src/server_connector/server_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomeScreenViewModel extends BaseModel {
  //-------------VARIABLES-------------//
  int selectedIndex = 0;
  int randomNumber = 1;
  final PageController pageController = PageController();
  bool isLightOn = true;
  bool isACON = false;
  bool isSpeakerON = false;
  bool isFanON = false;
  bool isLightFav = false;
  bool isACFav = false;
  bool isSpeakerFav = false;
  bool isFanFav = false;

  ServerHandler servConn = ServerHandler("172.18.195.56", 12345);

  void generateRandomNumber() {
    randomNumber = Random().nextInt(8);
    notifyListeners();
  }
  void lightFav(){
    isLightFav = !isLightFav;
    notifyListeners();
  }
  void acFav(){
    isACFav = !isACFav;
    notifyListeners();
  }
  void speakerFav() {
    isSpeakerFav = !isSpeakerFav;
    notifyListeners();
  }
  void fanFav() {
    isFanFav = !isFanFav;
    notifyListeners();
  }

  void acSwitch() {
    isACON = !isACON;
    notifyListeners();
  }

  void speakerSwitch() {
    isSpeakerON = !isSpeakerON;
    notifyListeners();
  }

  void fanSwitch() {
    isFanON = !isFanON;
    notifyListeners();
  }

  Future<void> lightSwitch() async {
    isLightOn = !isLightOn;
    if(isLightOn) {
      servConn.sendMessage("Turned on the light");
    }
    else {
      servConn.sendMessage("Turned off the light");
    }
    notifyListeners();
  }

  ///On tapping bottom nav bar items
  void onItemTapped(int index) {
    selectedIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    notifyListeners();
  }
}




