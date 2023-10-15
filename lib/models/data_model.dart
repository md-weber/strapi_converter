import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'data_model.freezed.dart';

part 'data_model.g.dart';

@freezed
class DataModel with _$DataModel {
  const factory DataModel({
    required int id,
    required Map<String, dynamic> attributes,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}
