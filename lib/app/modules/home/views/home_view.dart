import 'package:flutter/material.dart';
import 'package:flutter_pulodev_getx/app/modules/home/widgets/card_contents_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          child: SingleChildScrollView(
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
                                  onPressed: () => filterCategoryC
                                      .changeFilterByMedia(data.name),
                                  child: Text(
                                    controller.changeFilterMediaName(data.name),
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
                controller.obx(
                  onLoading: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  (state) => (state != null)
                      ? StaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          children: state
                              .map<Widget>(
                                (data) => CardContentsWidget(data: data),
                              )
                              .toList(),
                        )
                      : const SizedBox.shrink(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
