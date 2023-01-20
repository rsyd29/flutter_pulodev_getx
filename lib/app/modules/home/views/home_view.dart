import 'package:flutter/material.dart';
import 'package:flutter_pulodev_getx/app/modules/home/controllers/filter_category_controller.dart';
import 'package:flutter_pulodev_getx/app/modules/home/widgets/card_contents_widget.dart';
import 'package:flutter_pulodev_getx/app/modules/home/widgets/filter_media_widget.dart';
import 'package:flutter_pulodev_getx/app/modules/home/widgets/search_contents_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          leading: Container(
            margin: const EdgeInsets.only(
              left: 16.0,
            ),
            child: SvgPicture.asset(
              'assets/icons/ic_logo.svg',
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'PuloDev',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Kumpulan Konten Developer Indonesia',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.15),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Column(
                children: const [
                  SearchContentsWidget(),
                  SizedBox(
                    height: 8.0,
                  ),
                  FilterMediaWidget()
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RefreshIndicator(
            onRefresh: () async => (Get.find<FilterCategoryController>()
                        .state !=
                    null)
                ? ((Get.find<FilterCategoryController>().state ?? '') == 'all')
                    ? controller.getAllContent()
                    : controller.getAllContentWithFilterByMedia(
                        Get.find<FilterCategoryController>().state ?? '',
                      )
                : controller.getAllContent(),
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  controller.obx(
                    onLoading: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
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
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
