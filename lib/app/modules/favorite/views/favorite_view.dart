import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../home/widgets/card_contents_widget.dart';
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
      body: Center(
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
    );
  }
}
