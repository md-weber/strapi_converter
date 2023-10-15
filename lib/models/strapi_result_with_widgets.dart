import 'package:flutter/widgets.dart';
import 'package:strapi_converter/models/strapi_return_model.dart';

class StrapiResultWithWidget {
  StrapiReturnModel strapiReturnModel;
  List<Widget> convertedRichText;

  StrapiResultWithWidget(
      {required this.strapiReturnModel, required this.convertedRichText});
}
