import 'package:strapi_converter/models/strapi_attribute_models.dart';
import 'package:strapi_converter/models/strapi_model.dart';

class StrapiReturnModel {
  List<AttributeRichTextModel> richTextModels;
  List<AttributeDateTimeModel> dateTimeModels;
  List<AttributeStringModel> stringModels;
  List<AttributeUnknownModel> unknownModels;

  StrapiReturnModel({
    required this.richTextModels,
    required this.dateTimeModels,
    required this.stringModels,
    required this.unknownModels,
  });
}
