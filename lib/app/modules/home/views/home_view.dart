import 'package:flutter/material.dart';
import 'package:flutter_pulodev_getx/app/modules/home/widgets/card_contents_widget.dart';
import 'package:flutter_pulodev_getx/app/modules/home/widgets/filter_media_widget.dart';
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
                      ? FilterMediaWidget(
                          filterCategoryC: filterCategoryC,
                          state: state,
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
