import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/filter_category_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final filterCategoryC = Get.find<FilterCategoryController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              filterCategoryC.obx(
                (state) => (state != null)
                    ? SizedBox(
                        height: 50.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Media.values.length,
                          itemBuilder: (context, index) {
                            var data = Media.values[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                                vertical: 8.0,
                              ),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: state.contains(data.name)
                                        ? Colors.black
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                onPressed: () => filterCategoryC
                                    .changeFilterByMedia(data.name),
                                child: Text(
                                  data.name.capitalizeFirst!,
                                  style: TextStyle(
                                    color: state.contains(data.name)
                                        ? Colors.black
                                        : Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Center(
                child: Text(
                  'HomeView is working',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
