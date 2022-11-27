import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/filter_category_controller.dart';
import '../controllers/home_controller.dart';

class FilterMediaWidget extends GetView<FilterCategoryController> {
  const FilterMediaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeC = Get.find<HomeController>();

    return controller.obx(
      (state) => (state != null)
          ? SizedBox(
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Media.values.length,
                itemBuilder: (context, index) {
                  int lastIndexMedia = Media.values.length;
                  var data = Media.values[index];
                  return Container(
                    margin: EdgeInsets.only(
                      top: 4.0,
                      bottom: 4.0,
                      left: index == 0 ? 0 : 8,
                      right: index == lastIndexMedia - 1 ? 0 : 4,
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
                      onPressed: () =>
                          controller.changeFilterByMedia(data.name),
                      child: Text(
                        homeC.changeFilterMediaName(data.name),
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
    );
  }
}
