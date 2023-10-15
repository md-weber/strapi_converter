import 'package:flutter/material.dart';
import 'package:strapi_converter/models/strapi_attribute_models.dart';

List<Widget> convertRichTextModelToWidgets({
  required AttributeRichTextModel richTextModel,
  TextTheme? textTheme,
  RichTextStyleOverwrite? richTextStyleOverwrite,
}) {
  List<Widget> widgets = [];

  for (var (heading, paragraph) in richTextModel.richTextElements) {
    if (heading == null && paragraph == null) continue;
    if (heading != null) {
      widgets
          .add(Text(heading.text, style: _getStyle(heading.level, textTheme)));
    }
    if (paragraph != null) {
      final firstChild = paragraph.children.removeAt(0);

      widgets.add(
        RichText(
          text: TextSpan(
            text: firstChild.text,
            style: firstChild.bold
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(),
            children: [
              for (var child in paragraph.children)
                TextSpan(
                  text: child.text,
                  style: child.bold
                      ? const TextStyle(fontWeight: FontWeight.bold)
                      : const TextStyle(fontWeight: FontWeight.normal),
                ),
            ],
          ),
        ),
      );
    }
  }

  return widgets;
}

TextStyle _getStyle(int level, TextTheme? theme) {
  switch (level) {
    case 1:
      return theme?.titleLarge ?? const TextStyle();
    case 2:
      return theme?.titleMedium ?? const TextStyle();
    case 3:
      return theme?.titleSmall ?? const TextStyle();
    case 4:
      return theme?.headlineLarge ?? const TextStyle();
    case 5:
      return theme?.headlineMedium ?? const TextStyle();
    default:
      throw StateError(
        "[Heading - GetStyle] At the moment only a level of 5 is supported.",
      );
  }
}

/// This class enables you to overwrite the Rich Text Styles
class RichTextStyleOverwrite {}
