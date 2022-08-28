import 'package:global_knowledge_school/common_package.dart';
Widget lables({
  required String lable,
  TextStyle? style,
  Color textColor = black,
  FontWeight? fontWeights,
  List<double> presetSize = const [15, 16, 17],
}) {
  return AutoSizeText(
    lable,
    style: TextStyle(color: textColor, fontWeight: fontWeights),
    presetFontSizes: presetSize,
  );
}

TextStyle headingStyle({
  Color styleColor = black,
  double styleSize = 21,
  styleWidth = FontWeight.bold,
}) =>
    TextStyle(
      color: styleColor,
      fontSize: styleSize,
      fontWeight: styleWidth,
    );

TextStyle commonStyle({
  Color fontColor = black,
  double fontSizes = 19,
  FontWeight? fontWeights,
}) =>
    TextStyle(
      color: fontColor,
      fontSize: fontSizes,
      fontWeight: fontWeights,
    );

TextStyle subTitleStyle({
  Color fontColor = black,
  double fontSizes = 16,
  FontWeight? fontWeights,
}) =>
    TextStyle(
      color: fontColor,
      fontSize: fontSizes,
      fontWeight: fontWeights,
    );