import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_contents_controller.dart';

class SearchContentsWidget extends GetView<SearchContentsController> {
  const SearchContentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.searchController,
      cursorColor: Colors.black,
      onChanged: (newSearchTerm) => controller.onSearchContent(newSearchTerm),
      decoration: InputDecoration(
        hintText: 'Search',
        labelStyle: const TextStyle(
          color: Colors.black,
          decorationColor: Colors.black,
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
