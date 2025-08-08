// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
  id: json['id'] as String,
  name: json['name'] as String?,
  url: json['url'] as String?,
  image: json['image'] as String?,
  description: json['description'] as String?,
  category: json['category'] as String?,
  language: json['language'] as String?,
  country: json['country'] as String?,
);

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'url': instance.url,
  'image': instance.image,
  'description': instance.description,
  'category': instance.category,
  'language': instance.language,
  'country': instance.country,
};
