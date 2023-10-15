import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:strapi_converter/models/strapi_attribute_models.dart';
import 'package:strapi_converter/models/strapi_return_model.dart';
import 'package:strapi_converter/strapi_converter/converter.dart';

import 'test_data.dart';

void main() {
  group("converter", () {
    Iterable<AttributeRichTextModel> richTextModels = [];
    setUp(() {
      final result =
          StrapiConverter().convertFromJson(jsonDecode(strapiTestJson));
      richTextModels = result.richTextModels;
    });

    test("should convert a received JSON to a Strapi Model", () {
      var result = StrapiConverter().convertFromJson(
        jsonDecode(strapiTestJson),
      );

      expect(result, isA<StrapiReturnModel>());

      expect(result.dateTimeModels.length, 5);
      expect(result.stringModels.length, 2);
      expect(result.unknownModels.length, 0);
      expect(result.richTextModels.length, 1);
    });

    group("RichTextConverter", () {
      group("should convert a paragraph", () {
        test("without styling correctly", () {
          expect(richTextModels.first.name, "Test");
          final paragraph = richTextModels.first.paragraphs.first;
          expect(paragraph!.type, "paragraph");
          expect(
            paragraph.children[0].text,
            "In der schnelllebigen Welt der digitalen Technologien kann es eine Herausforderung sein, Schritt zu halten. Doch zum Glück gibt es Initiativen wie das Digitalcafé Karlsruhe, die sich der Aufgabe verschrieben haben, interessierten Bürger*innen bei ihren Fragen rund um Computer, Smartphone, Tablet und Apps behilflich zu sein.",
          );
        });

        test("with styling correctly", () {
          var paragraph = richTextModels.first.paragraphs[11];
          expect(paragraph!.type, "paragraph");
          expect(paragraph.children[0].text, "Internet Security");
          expect(paragraph.children[0].type, "text");
          expect(paragraph.children[0].bold, true);

          expect(paragraph.children[1].text,
              ": Lernen Sie, wie Sie sich online schützen können, um sicher im Internet zu surfen.");
          expect(paragraph.children[1].type, "text");
          expect(paragraph.children[1].bold, false);
        });
      });

      test("should convert a heading without styling correctly", () {
        final heading = richTextModels.first.headings.first;
        expect(heading!.type, "heading");
        expect(
          heading.text,
          "Willkommen im Digitalcafé Karlsruhe",
        );
      });
    });
  });
}
