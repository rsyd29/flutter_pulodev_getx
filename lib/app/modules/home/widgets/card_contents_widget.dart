import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../../../data/model/contents_model.dart';

class CardContentsWidget extends StatelessWidget {
  const CardContentsWidget({Key? key, required this.data}) : super(key: key);
  final DatumContents data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
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
          data.thumbnail != null
              ? CachedNetworkImage(imageUrl: data.thumbnail!)
              : const SizedBox.shrink(),
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
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
    );
  }
}
