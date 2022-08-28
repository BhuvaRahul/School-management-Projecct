import 'package:global_knowledge_school/common_package.dart';
commonAppbar({
  required Widget? lable,
  Color? backgroundColor,
  Widget? leadings,
  List<Widget>? action,
}) =>
    AppBar(
      title: lable,
      backgroundColor: green300,
      actions: action,
    );
