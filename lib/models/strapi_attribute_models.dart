abstract class AttributeModelEntry {}

class AttributeRichTextModel extends AttributeModelEntry {
  final String name;
  final List<RichTextHeading> headings;
  final List<RichTextParagraph> paragraphs;

  AttributeRichTextModel({
    required this.headings,
    required this.paragraphs,
    required this.name,
  });
}

class RichTextParagraph {
  final List<RichTextParagraphChild> children;
  final String type;

  RichTextParagraph({required this.type, required this.children});
}

class RichTextParagraphChild {
  final String text;
  final String type;
  final bool bold;

  RichTextParagraphChild({
    this.bold = false,
    required this.text,
    required this.type,
  });
}

class RichTextHeading {
  final String text;
  final String type;
  final int level;

  RichTextHeading({
    required this.text,
    required this.type,
    required this.level,
  });
}

class AttributeDateTimeModel extends AttributeModelEntry {
  final String name;
  final DateTime entry;

  AttributeDateTimeModel({required this.name, required this.entry});
}

class AttributeUnknownModel extends AttributeModelEntry {
  final String name;
  final dynamic entry;
  final String info =
      "This attribute is unknown to the library, feel free to contribute!";

  AttributeUnknownModel({required this.name, required this.entry});
}

class AttributeStringModel extends AttributeModelEntry {
  final String name;
  final String entry;

  AttributeStringModel({required this.name, required this.entry});
}
