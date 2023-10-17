import 'package:strapi_converter/models/strapi_attribute_models.dart';

class StrapiReturnModel {
  List<AttributeRichTextModel> richTextModels;
  List<AttributeDateTimeModel> dateTimeModels;
  List<AttributeStringModel> stringModels;
  List<StrapiReturnModel> childModels;
  List<AttributeUnknownModel> unknownModels;

  StrapiReturnModel({
    required this.richTextModels,
    required this.dateTimeModels,
    required this.stringModels,
    required this.childModels,
    required this.unknownModels,
  });
}
