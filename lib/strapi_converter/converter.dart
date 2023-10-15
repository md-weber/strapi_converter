import 'package:flutter/widgets.dart';
import 'package:strapi_converter/models/strapi_attribute_models.dart';
import 'package:strapi_converter/models/strapi_model.dart';
import 'package:strapi_converter/models/strapi_result_with_widgets.dart';
import 'package:strapi_converter/models/strapi_return_model.dart';
import 'package:strapi_converter/strapi_converter/rich_text_visualization.dart';

typedef JSON = Map<String, dynamic>;

class StrapiConverter {
  StrapiReturnModel convertFromJson(JSON json) {
    var model = StrapiModel.fromJson(json);

    StrapiReturnModel returnModel = StrapiReturnModel(
      richTextModels: [],
      dateTimeModels: [],
      stringModels: [],
      unknownModels: [],
    );

    for (var attribute in model.data.attributes.entries) {
      if (attribute.value is String) {
        var dateTime = DateTime.tryParse(attribute.value);
        if (dateTime != null) {
          returnModel.dateTimeModels.add(
            AttributeDateTimeModel(name: attribute.key, entry: dateTime),
          );
          continue;
        }

        returnModel.stringModels.add(
          AttributeStringModel(name: attribute.key, entry: attribute.value),
        );
        continue;
      }

      if (attribute.value is List<dynamic>) {
        returnModel.richTextModels.add(
          _convertRichText(attribute.key, attribute.value),
        );
        continue;
      }

      returnModel.unknownModels.add(
        AttributeUnknownModel(name: attribute.key, entry: attribute.value),
      );
    }

    return returnModel;
  }

  AttributeRichTextModel _convertRichText(
    String name,
    List<dynamic> richText,
  ) {
    final model =
        AttributeRichTextModel(name: name, headings: [], paragraphs: []);

    for (var richTextAttribute in richText) {
      final attributeType = richTextAttribute.entries
          .firstWhere((e) => e.key == "type") as MapEntry<String, dynamic>;

      final attributeChildren = richTextAttribute.entries.firstWhere(
        (e) => e.key == "children",
      ) as MapEntry<String, dynamic>;

      switch (attributeType.value) {
        case "paragraph":
          RichTextParagraph textParagraph = _convertTextParagraph(
            attributeType,
            attributeChildren,
          );
          model.paragraphs.add(textParagraph);
          continue;
        case "heading":
          final attributeLevel = richTextAttribute.entries.firstWhere(
            (element) => element.key == "level",
          ) as MapEntry<String, dynamic>;

          var heading = RichTextHeading(
            level: attributeLevel.value,
            text: attributeChildren.value[0].entries
                .firstWhere((e) => e.key == "text")
                .value,
            type: attributeType.value,
          );

          model.headings.add(heading);
          continue;
      }
    }
    return model;
  }

  RichTextParagraph _convertTextParagraph(
    MapEntry<String, dynamic> attributeType,
    MapEntry<String, dynamic> attributeChildren,
  ) {
    var paragraph = RichTextParagraph(type: attributeType.value, children: []);

    for (Map<String, dynamic> child in attributeChildren.value) {
      var text = child.entries.firstWhere((e) => e.key == "text").value;
      var type = child.entries.firstWhere((e) => e.key == "type").value;
      var bold = child.entries
          .firstWhere(
            (e) => e.key == "bold",
            orElse: () => const MapEntry("bold", false),
          )
          .value;

      var paragraphChild =
          RichTextParagraphChild(text: text, type: type, bold: bold);

      paragraph.children.add(paragraphChild);
    }

    return paragraph;
  }

  StrapiResultWithWidget convertFromJsonToWidgets(context, JSON json) {
    final result = StrapiConverter().convertFromJson(json);

    final attributeRichTextModel = result.richTextModels.first;

    List<Widget> resultList = convertRichTextModelToWidgets(
      context,
      richTextModel: attributeRichTextModel,
    );

    return StrapiResultWithWidget(
      strapiReturnModel: result,
      convertedRichText: resultList,
    );
  }

  List<Widget> convertRichTextAttributeToWidgets({
    required BuildContext context,
    required AttributeRichTextModel richTextModel,
  }) {
    return convertRichTextModelToWidgets(context, richTextModel: richTextModel);
  }
}
