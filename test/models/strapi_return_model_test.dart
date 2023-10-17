import 'package:flutter_test/flutter_test.dart';
import 'package:strapi_converter/models/strapi_attribute_models.dart';
import 'package:strapi_converter/models/strapi_return_model.dart';

void main() {
  group("StrapiReturnModel", () {
    group("getString", () {
      test("WHEN there is no element THEN throw an error", () {
        final strapiReturnModel = StrapiReturnModel(
            richTextModels: [],
            dateTimeModels: [],
            stringModels: [],
            childModels: [],
            unknownModels: []);

        expect(
          () => strapiReturnModel.getString("name"),
          throwsA(isA<StateError>()),
        );
      });
      test("WHEN there is a element THEN return a string", () {
        final strapiReturnModel = StrapiReturnModel(
            richTextModels: [],
            dateTimeModels: [],
            stringModels: [
              AttributeStringModel(name: "name", entry: "Jon Doe")
            ],
            childModels: [],
            unknownModels: []);

        String result = strapiReturnModel.getString("name");
        expect(result, "Jon Doe");
      });
      test("WHEN there is a child element THEN find also that one", () {
        final strapiReturnModel = StrapiReturnModel(
          richTextModels: [],
          dateTimeModels: [],
          stringModels: [],
          childModels: [
            StrapiReturnModel(
              richTextModels: [],
              dateTimeModels: [],
              stringModels: [
                AttributeStringModel(name: "name", entry: "Jon Doe")
              ],
              childModels: [],
              unknownModels: [],
            )
          ],
          unknownModels: [],
        );

        String result = strapiReturnModel.getString("name");
        expect(result, "Jon Doe");
      });
      test("WHEN there is a child in a child element THEN find also that one",
          () {
        final strapiReturnModel = StrapiReturnModel(
          richTextModels: [],
          dateTimeModels: [],
          stringModels: [],
          childModels: [
            StrapiReturnModel(
              richTextModels: [],
              dateTimeModels: [],
              stringModels: [],
              childModels: [
                StrapiReturnModel(
                  richTextModels: [],
                  dateTimeModels: [],
                  stringModels: [
                    AttributeStringModel(name: "name", entry: "Jon Doe")
                  ],
                  childModels: [],
                  unknownModels: [],
                )
              ],
              unknownModels: [],
            )
          ],
          unknownModels: [],
        );

        String result = strapiReturnModel.getString("name");
        expect(result, "Jon Doe");
      });
    });

    group("getDateTime", () {
      test("WHEN there is no element THEN throw an error", () {
        final strapiReturnModel = StrapiReturnModel(
            richTextModels: [],
            dateTimeModels: [],
            stringModels: [],
            childModels: [],
            unknownModels: []);

        expect(
          () => strapiReturnModel.getDateTime("name"),
          throwsA(isA<StateError>()),
        );
      });
      test("WHEN there is a element THEN return a DateTime", () {
        final strapiReturnModel = StrapiReturnModel(
          richTextModels: [],
          dateTimeModels: [
            AttributeDateTimeModel(
              name: "published",
              entry: DateTime(2023, 10, 23),
            )
          ],
          stringModels: [],
          childModels: [],
          unknownModels: [],
        );

        DateTime result = strapiReturnModel.getDateTime("published");
        expect(result, DateTime(2023, 10, 23));
      });
      test("WHEN there is a child element THEN find also that one", () {
        final strapiReturnModel = StrapiReturnModel(
          richTextModels: [],
          dateTimeModels: [],
          stringModels: [],
          childModels: [
            StrapiReturnModel(
              richTextModels: [],
              dateTimeModels: [
                AttributeDateTimeModel(
                  name: "published",
                  entry: DateTime(2023, 10, 23),
                )
              ],
              stringModels: [],
              childModels: [],
              unknownModels: [],
            )
          ],
          unknownModels: [],
        );

        DateTime result = strapiReturnModel.getDateTime("published");
        expect(result, DateTime(2023, 10, 23));
      });
      test("WHEN there is a child in a child element THEN find also that one",
          () {
        final strapiReturnModel = StrapiReturnModel(
          richTextModels: [],
          dateTimeModels: [],
          stringModels: [],
          childModels: [
            StrapiReturnModel(
              richTextModels: [],
              dateTimeModels: [],
              stringModels: [],
              childModels: [
                StrapiReturnModel(
                  richTextModels: [],
                  dateTimeModels: [
                    AttributeDateTimeModel(
                      name: "published",
                      entry: DateTime(2023, 10, 23),
                    )
                  ],
                  stringModels: [],
                  childModels: [],
                  unknownModels: [],
                )
              ],
              unknownModels: [],
            )
          ],
          unknownModels: [],
        );

        DateTime result = strapiReturnModel.getDateTime("published");
        expect(result, DateTime(2023, 10, 23));
      });
    });
  });
}
