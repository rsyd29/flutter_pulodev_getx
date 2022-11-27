// To parse this JSON data, do
//
//     final contentsModel = contentsModelFromJson(jsonString);

import 'dart:convert';

ContentsModel contentsModelFromJson(String str) =>
    ContentsModel.fromJson(json.decode(str));

String contentsModelToJson(ContentsModel data) => json.encode(data.toJson());

class ContentsModel {
  ContentsModel({
    required this.data,
    required this.total,
  });

  final List<DatumContents> data;
  final int total;

  factory ContentsModel.fromJson(Map<String, dynamic> json) => ContentsModel(
        data: List<DatumContents>.from(
            json["data"].map((x) => DatumContents.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
      };
}

class DatumContents {
  DatumContents({
    required this.id,
    required this.title,
    required this.url,
    required this.body,
    required this.tags,
    required this.media,
    required this.thumbnail,
    required this.owner,
    required this.draft,
    required this.originalPublishedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.sourceId,
    required this.contributor,
  });

  final int id;
  final String title;
  final String url;
  final String? body;
  final String tags;
  final String media;
  final String? thumbnail;
  final String owner;
  final bool draft;
  final DateTime originalPublishedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final int? sourceId;
  final String contributor;

  factory DatumContents.fromJson(Map<String, dynamic> json) => DatumContents(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        body: json["body"],
        tags: json["tags"],
        media: json["media"],
        thumbnail: json["thumbnail"],
        owner: json["owner"],
        draft: json["draft"],
        originalPublishedAt: DateTime.parse(json["original_published_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        sourceId: json["source_id"],
        contributor: json["contributor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "body": body,
        "tags": tags,
        "media": media,
        "thumbnail": thumbnail,
        "owner": owner,
        "draft": draft,
        "original_published_at": originalPublishedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "source_id": sourceId,
        "contributor": contributor,
      };
}
