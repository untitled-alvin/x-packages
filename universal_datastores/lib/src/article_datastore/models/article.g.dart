// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
  guid: json['guid'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  ownerId: json['owner_id'] as String,
  modifiedId: json['modified_id'] as String?,
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  apiArticleId: json['api_article_id'] as String?,
  source: json['source'] == null
      ? null
      : Source.fromJson(json['source'] as Map<String, dynamic>),
  author: json['author'] == null
      ? null
      : Author.fromJson(json['author'] as Map<String, dynamic>),
  sourceId: json['source_id'] as String,
  authorName: json['author_name'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  summary: json['summary'] as String?,
  content: json['content'] as String?,
  imageUrl: json['image_url'] as String?,
  videoUrl: json['video_url'] as String?,
  publishedAt: json['published_at'] == null
      ? null
      : DateTime.parse(json['published_at'] as String),
  ingestedAt: json['ingested_at'] == null
      ? null
      : DateTime.parse(json['ingested_at'] as String),
  isFeatured: json['is_featured'] as bool? ?? false,
);

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
  'guid': instance.guid,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'modified_id': instance.modifiedId,
  'owner_id': instance.ownerId,
  'api_article_id': instance.apiArticleId,
  'source': instance.source?.toJson(),
  'author': instance.author?.toJson(),
  'source_id': instance.sourceId,
  'author_name': instance.authorName,
  'title': instance.title,
  'slug': instance.slug,
  'description': instance.description,
  'summary': instance.summary,
  'content': instance.content,
  'image_url': instance.imageUrl,
  'video_url': instance.videoUrl,
  'published_at': instance.publishedAt?.toIso8601String(),
  'ingested_at': instance.ingestedAt?.toIso8601String(),
  'is_featured': instance.isFeatured,
};
