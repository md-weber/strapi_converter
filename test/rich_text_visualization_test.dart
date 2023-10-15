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
            context,
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
              name: "Test", headings: [], paragraphs: []),
          richTextStyleOverwrite: RichTextStyleOverwrite(),
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
              name: "Test", headings: [], paragraphs: []),
          richTextStyleOverwrite: RichTextStyleOverwrite(),
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
        final theme = ThemeData.dark().copyWith(
          textTheme: ThemeData.dark().textTheme.copyWith(
                titleMedium: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
        );

        await t.pumpWidget(
          createTestWidgets(
            richTextModel: AttributeRichTextModel(
              name: "Test",
              headings: [
                RichTextHeading(
                  text: 'Digital Natives',
                  type: 'text',
                  level: 2,
                )
              ],
              paragraphs: [],
            ),
            richTextStyleOverwrite: RichTextStyleOverwrite(),
            globalKey: key,
            theme: theme,
          ),
        );

        final columnFinder = find.byKey(key);
        final descendantFinder = find.descendant(
          of: columnFinder,
          matching: find.byType(Text),
        );

        final widget = t.firstWidget<Text>(descendantFinder);
        expect(widget.style!.fontSize, theme.textTheme.titleMedium!.fontSize);
        expect(
            widget.style!.fontWeight, theme.textTheme.titleMedium!.fontWeight);

        expect(columnFinder, findsOneWidget);
        expect(descendantFinder, findsOneWidget);
      });

      testWidgets(
          "should return multiple Text Element with different level headings",
          (WidgetTester t) async {
        final theme = ThemeData.dark().copyWith(
          textTheme: ThemeData.dark().textTheme.copyWith(
                titleMedium: const TextStyle(
                  fontSize: 1,
                  fontWeight: FontWeight.w100,
                ),
                titleLarge: const TextStyle(
                  fontSize: 2,
                  fontWeight: FontWeight.w200,
                ),
                titleSmall: const TextStyle(
                  fontSize: 3,
                  fontWeight: FontWeight.w300,
                ),
                headlineLarge: const TextStyle(
                  fontSize: 4,
                  fontWeight: FontWeight.w400,
                ),
                headlineMedium: const TextStyle(
                  fontSize: 5,
                  fontWeight: FontWeight.w500,
                ),
              ),
        );

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
              headings: [
                headingOne,
                headingTwo,
                headingThree,
                headingFour,
                headingFive
              ],
              paragraphs: [],
            ),
            richTextStyleOverwrite: RichTextStyleOverwrite(),
            theme: theme,
          ),
        );

        final columnFinder = find.byType(Column);
        final descendantFinder = find.descendant(
          of: columnFinder,
          matching: find.byType(Text),
        );

        final textWidgets = t.widgetList<Text>(descendantFinder);

        var textOne = textWidgets.elementAt(0);
        var textTwo = textWidgets.elementAt(1);
        var textThree = textWidgets.elementAt(2);
        var textFour = textWidgets.elementAt(3);
        var textFive = textWidgets.elementAt(4);

        void expectTextToBe(widget, themeStyle) {
          expect(widget.style!.fontSize, themeStyle.fontSize);
          expect(widget.style!.fontWeight, themeStyle.fontWeight);
        }

        expectTextToBe(textOne, theme.textTheme.titleMedium);
        expectTextToBe(textTwo, theme.textTheme.titleLarge);
        expectTextToBe(textThree, theme.textTheme.titleSmall);
        expectTextToBe(textFour, theme.textTheme.headlineLarge);
        expectTextToBe(textFive, theme.textTheme.headlineMedium);

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
              paragraphs: [
                RichTextParagraph(
                  type: 'paragraph',
                  children: [
                    RichTextParagraphChild(
                      text: "This is a paragraph",
                      type: "type",
                    )
                  ],
                ),
              ],
              headings: [],
            ),
            richTextStyleOverwrite: RichTextStyleOverwrite(),
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
