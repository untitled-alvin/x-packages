// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
  guid: json['guid'] as String,
  ownerId: json['ownerId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  sourceId: json['sourceId'] as String?,
  authorName: json['authorName'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  content: json['content'] as String?,
  summary: json['summary'] as String?,
  imageUrl: json['imageUrl'] as String?,
  videoUrl: json['videoUrl'] as String?,
  apiArticleId: json['apiArticleId'] as String?,
  modifiedId: json['modifiedId'] as String?,
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  publishedAt: json['publishedAt'] == null
      ? null
      : DateTime.parse(json['publishedAt'] as String),
  ingestedAt: json['ingestedAt'] == null
      ? null
      : DateTime.parse(json['ingestedAt'] as String),
  isFeatured: json['isFeatured'] as bool? ?? false,
  source: json['source'] == null
      ? null
      : Source.fromJson(json['source'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
  'guid': instance.guid,
  'ownerId': instance.ownerId,
  'sourceId': instance.sourceId,
  'authorName': instance.authorName,
  'title': instance.title,
  'slug': instance.slug,
  'description': instance.description,
  'content': instance.content,
  'summary': instance.summary,
  'imageUrl': instance.imageUrl,
  'videoUrl': instance.videoUrl,
  'apiArticleId': instance.apiArticleId,
  'modifiedId': instance.modifiedId,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'publishedAt': instance.publishedAt?.toIso8601String(),
  'ingestedAt': instance.ingestedAt?.toIso8601String(),
  'isFeatured': instance.isFeatured,
  'source': instance.source,
};
