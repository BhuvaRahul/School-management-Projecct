import 'package:global_knowledge_school/common_package.dart';


Widget commonFloatingActionButton({
  required void Function() onPress,
}) {
  return FloatingActionButton(
    onPressed: onPress,
    backgroundColor: green300,
    elevation: 2,
    child: Icon(
      icAdd,
      color: black,
    ),
  );
}
