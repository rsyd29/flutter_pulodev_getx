import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends GetView<BottomNavigationController> {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => state != null
          ? Scaffold(
              body: controller.allMenuScreens[state],
              bottomNavigationBar: BottomAppBar(
                color: Colors.white,
                child: SizedBox(
                  height: Get.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: Iterable.generate(
                        controller.allMenu.length,
                        (index) {
                          var data = controller.allMenu[index];
                          return InkWell(
                            onTap: () => controller
                                .changeIndexBottomNavigationBar(index),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                data.toLowerCase().contains('beranda')
                                    ? Icon(
                                        Icons.home,
                                        color: index == state
                                            ? Colors.black
                                            : Colors.grey,
                                      )
                                    : Icon(
                                        Icons.bookmark,
                                        color: index == state
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                Text(
                                  data,
                                  style: TextStyle(
                                    color: index == state
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
