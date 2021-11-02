// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    title: json['title'] as String,
    description: json['description'] as String,
    urlVideo: json['urlVideo'] as String,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'urlVideo': instance.urlVideo,
    };
