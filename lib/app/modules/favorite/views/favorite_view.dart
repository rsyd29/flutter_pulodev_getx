import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Favorite',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FavoriteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
