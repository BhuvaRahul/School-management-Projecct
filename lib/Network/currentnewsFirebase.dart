import 'package:firebase_database/firebase_database.dart';
import '../common_package.dart';

FirebaseDatabase currentNewsFirebase = FirebaseDatabase.instance;

addCurrentNews() async {
  String? key = currentNewsFirebase.ref('Current News').push().key;
  await currentNewsFirebase
      .ref('Current News')
      .child(key!)
      .set({'currentNews': txtCurrentNewsController.text, 'key': key});
}

showCurrentNews() async {
  await currentNewsFirebase.ref('Current News').once().then((value) {
    Map currentsNews = value.snapshot.value as Map;
    currentsNews.forEach((key, value) {
      currentNewsDetails.add(value);
    });
  });
}
