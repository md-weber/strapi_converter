import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:strapi_converter/models/strapi_attribute_models.dart';
import 'package:strapi_converter/strapi_converter/rich_text_visualization.dart';

Widget createTestWidgets({
  required richTextModel,
  required richTextStyleOverwrite,
  theme,
  globalKey,
}) {
  return MaterialApp(
    theme: theme ?? ThemeData.dark(),
    home: Scaffold(
      body: Builder(
        builder: (context) => Column(
          key: globalKey ?? GlobalKey(),
          children: convertRichTextModelToWidgets(
            richTextModel: richTextModel,
            richTextStyleOverwrite: richTextStyleOverwrite,
          ),
        ),
      ),
    ),
  );
}

void main() {
  group("RichTextVisualizationText", () {
    testWidgets("should return an empty list if the list of widgets is empty",
        (WidgetTester t) async {
      var key = GlobalKey();

      await t.pumpWidget(
        createTestWidgets(
          richTextModel: AttributeRichTextModel(
            name: "Test",
            richTextElements: [],
          ),
          richTextStyleOverwrite: const RichTextStyleOverwrite(),
          globalKey: key,
        ),
      );

      final columnFinder = find.byKey(key);
      final ancestorFinder = find.ancestor(
        of: columnFinder,
        matching: find.byType(Text),
      );

      expect(ancestorFinder, findsNothing);
    });

    testWidgets("should return nothing when the list contains no values",
        (WidgetTester t) async {
      await t.pumpWidget(
        createTestWidgets(
          richTextModel: AttributeRichTextModel(
            name: "Test",
            richTextElements: [],
          ),
          richTextStyleOverwrite: const RichTextStyleOverwrite(),
        ),
      );

      final columnFinder = find.byType(Column);
      final descendantFinder = find.descendant(
        of: columnFinder,
        matching: find.byType(Text),
      );

      expect(columnFinder, findsOneWidget);
      expect(descendantFinder, findsNothing);
    });

    group("Headlines", () {
      testWidgets("should return a Text Element with a level 2 heading",
          (WidgetTester t) async {
        GlobalKey key = GlobalKey();

        await t.pumpWidget(
          createTestWidgets(
            richTextModel: AttributeRichTextModel(
              name: "Test",
              richTextElements: [
                (
                  RichTextHeading(
                    text: 'Digital Natives',
                    type: 'text',
                    level: 2,
                  ),
                  null
                )
              ],
            ),
            richTextStyleOverwrite: const RichTextStyleOverwrite(),
            globalKey: key,
          ),
        );

        final columnFinder = find.byKey(key);
        final descendantFinder = find.descendant(
          of: columnFinder,
          matching: find.byType(Text),
        );

        expect(columnFinder, findsOneWidget);
        expect(descendantFinder, findsOneWidget);
      });

      testWidgets(
          "should return multiple Text Element with different level headings",
          (WidgetTester t) async {
        var headingOne = RichTextHeading(
          text: 'Digital Natives',
          type: 'text',
          level: 2,
        );
        var headingTwo = RichTextHeading(
          text: 'Digital Natives',
          type: 'text',
          level: 1,
        );
        var headingThree = RichTextHeading(
          text: 'Digital Natives',
          type: 'text',
          level: 3,
        );
        var headingFour = RichTextHeading(
          text: 'Digital Natives',
          type: 'text',
          level: 4,
        );
        var headingFive = RichTextHeading(
          text: 'Digital Natives',
          type: 'text',
          level: 5,
        );
        await t.pumpWidget(
          createTestWidgets(
            richTextModel: AttributeRichTextModel(
              name: "Test",
              richTextElements: [
                (headingOne, null),
                (headingTwo, null),
                (headingThree, null),
                (headingFour, null),
                (headingFive, null)
              ],
            ),
            richTextStyleOverwrite: const RichTextStyleOverwrite(),
          ),
        );

        final columnFinder = find.byType(Column);
        final descendantFinder = find.descendant(
          of: columnFinder,
          matching: find.byType(Text),
        );
        expect(columnFinder, findsOneWidget);
        expect(descendantFinder, findsNWidgets(5));
      });
    });

    group("Paragraphs", () {
      testWidgets("should return a richText when received a Paragraph",
          (WidgetTester t) async {
        await t.pumpWidget(
          createTestWidgets(
            richTextModel: AttributeRichTextModel(
              name: "Test",
              richTextElements: [
                (
                  null,
                  RichTextParagraph(
                    type: 'paragraph',
                    children: [
                      RichTextParagraphChild(
                        text: "This is a paragraph",
                        type: "type",
                      )
                    ],
                  )
                ),
              ],
            ),
            richTextStyleOverwrite: const RichTextStyleOverwrite(),
          ),
        );

        final columnFinder = find.byType(Column);
        final descendantFinder = find.descendant(
          of: columnFinder,
          matching: find.byType(RichText),
        );

        final test = t.firstWidget<RichText>(descendantFinder);

        expect(test.text.toPlainText(), "This is a paragraph");
        expect(columnFinder, findsOneWidget);
        expect(descendantFinder, findsOneWidget);
      });
    });
  });
}
