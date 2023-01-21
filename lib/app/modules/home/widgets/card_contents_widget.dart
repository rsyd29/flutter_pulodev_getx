import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pulodev_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_pulodev_getx/app/services/url_launcher_service.dart';
import 'package:get/get.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../../../data/model/contents_model.dart';

class CardContentsWidget extends StatelessWidget {
  const CardContentsWidget({Key? key, required this.data}) : super(key: key);
  final DatumContents data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(
              0,
              3,
            ), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (data.thumbnail != null && data.thumbnail != '')
              ? CachedNetworkImage(
                  imageUrl: data.thumbnail!,
                  errorWidget: (_, __, ___) => const SizedBox.shrink(),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  '[${data.media}]',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Dimasukkan oleh ${data.contributor} - ${timeago.format(
                    data.createdAt,
                    locale: 'id',
                  )}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                data.body != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Text(
                          data.body!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 8.0,
            ),
            child: Row(
              children: [
                Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Get.find<HomeController>().onPressedFavorite(data);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.bookmark),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () async {
                      /// TODO UrlLauncher to link url [data.url]
                      await UrlLauncherService.launchInAppWebView(data.url);
                    },
                    child: const Text(
                      'Lihat',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
