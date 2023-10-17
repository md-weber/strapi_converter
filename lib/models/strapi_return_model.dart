import 'package:strapi_converter/models/strapi_attribute_models.dart';

class StrapiReturnModel {
  int id;
  List<AttributeRichTextModel> richTextModels;
  List<AttributeDateTimeModel?> dateTimeModels;
  List<AttributeStringModel?> stringModels;
  List<StrapiReturnModel> childModels;
  List<AttributeUnknownModel> unknownModels;

  StrapiReturnModel({
    required this.id,
    required this.richTextModels,
    required this.dateTimeModels,
    required this.stringModels,
    required this.childModels,
    required this.unknownModels,
  });

  AttributeStringModel? _getStringModel(name) {
    return stringModels.firstWhere((e) => e!.name == name, orElse: () {
      AttributeStringModel? result;
      for (var child in childModels) {
        result = child._getStringModel(name);
      }
      return result;
    });
  }

  AttributeDateTimeModel? _getDateTimeModel(name) {
    return dateTimeModels.firstWhere((e) => e!.name == name, orElse: () {
      AttributeDateTimeModel? result;
      for (var child in childModels) {
        result = child._getDateTimeModel(name);
      }
      return result;
    });
  }

  String getString(String name) {
    var stringModel = _getStringModel(name);
    if (stringModel == null) throw StateError("No valid string exists");
    return stringModel.entry;
  }

  DateTime getDateTime(String name) {
    var dateTimeModel = _getDateTimeModel(name);
    if (dateTimeModel == null) throw StateError("No valid DateTime exists");
    return dateTimeModel.entry;
  }
}
