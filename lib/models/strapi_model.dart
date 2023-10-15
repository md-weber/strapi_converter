import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:strapi_converter/models/data_model.dart';

part 'strapi_model.freezed.dart';
part 'strapi_model.g.dart';

@freezed
class StrapiModel with _$StrapiModel {
  const factory StrapiModel({
    required DataModel data,
    required Map<String, dynamic> meta,
  }) = _StrapiModel;

  factory StrapiModel.fromJson(Map<String, Object?> json) =>
      _$StrapiModelFromJson(json);
}
