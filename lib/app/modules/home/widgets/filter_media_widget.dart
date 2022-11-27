import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/filter_category_controller.dart';
import '../controllers/home_controller.dart';

class FilterMediaWidget extends GetView<HomeController> {
  const FilterMediaWidget({
    Key? key,
    required this.filterCategoryC,
    required this.state,
  }) : super(key: key);
  final FilterCategoryController filterCategoryC;
  final String state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  color: state.contains(data.name) ? Colors.black : Colors.grey,
                  width: 2,
                ),
              ),
              onPressed: () => filterCategoryC.changeFilterByMedia(data.name),
              child: Text(
                controller.changeFilterMediaName(data.name),
                style: TextStyle(
                  color: state.contains(data.name) ? Colors.black : Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
