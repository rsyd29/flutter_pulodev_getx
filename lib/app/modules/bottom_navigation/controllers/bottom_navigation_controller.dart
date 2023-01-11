import 'package:flutter/material.dart';
import 'package:flutter_pulodev_getx/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController with StateMixin<int> {
  final allMenu = <String>['Beranda', 'Favorite'];
  final allMenuScreens = const <Widget>[
    HomeView(),
    Scaffold(
      body: Center(
        child: Text('Favorite'),
      ),
    )
  ];

  @override
  void onInit() {
    super.onInit();
    change(0, status: RxStatus.success());
  }

  void changeIndexBottomNavigationBar(int index) =>
      change(index, status: RxStatus.success());
}
