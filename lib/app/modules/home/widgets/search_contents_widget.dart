import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_contents_controller.dart';

class SearchContentsWidget extends GetView<SearchContentsController> {
  const SearchContentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: controller.searchController,
        cursorColor: Colors.black,
        onChanged: (value) => controller.textSearch.value = value,
        onFieldSubmitted: (newSearchTerm) =>
            controller.onSearchContent(newSearchTerm),
        decoration: InputDecoration(
          hintText: 'Search',
          labelStyle: const TextStyle(
            color: Colors.black,
            decorationColor: Colors.black,
          ),
          prefixIcon: const Icon(
            Icons.search,
          ),
          suffixIcon: controller.textSearch.trim().isNotEmpty
              ? IconButton(
                  onPressed: () => controller.clearSearch(),
                  icon: const Icon(Icons.close),
                )
              : null,
        ),
      );
    });
  }
}
