import 'package:global_knowledge_school/common_package.dart';

import '../../../../network/currentnewsFirebase.dart';

TextEditingController txtCurrentNewsController = TextEditingController();

class AddCurrentNews extends StatefulWidget {
  const AddCurrentNews({Key? key}) : super(key: key);

  @override
  State<AddCurrentNews> createState() => _AddCurrentNewsState();
}

class _AddCurrentNewsState extends State<AddCurrentNews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showCurrentNews();
    currentNewsDetails.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(lable: Text(currentNews, style: headingStyle())),
      floatingActionButton: commonFloatingActionButton(onPress: () {
        showDialog(
            context: context,
            builder: (context) => SimpleDialog(
                  children: [
                    Column(children: [
                      commonTextFormField(
                          controller: txtCurrentNewsController,
                          hintTex: currentNews),
                      commonButtons(
                          lable: const Text(submit),
                          onPress: () async {
                            await addCurrentNews();
                            currentNewsDetails.clear();
                            // await showCurrentNews();
                            setState(() {
                              Navigator.pop(context);
                            });
                          }),
                    ]),
                  ],
                ));
        setState(() {});
      }),
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: currentNewsDetails.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key(currentNewsDetails[index].toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  currentNewsFirebase
                      .ref('Current News')
                      .child(currentNewsDetails[index]['key'])
                      .remove();
                  currentNewsDetails.removeAt(index);
                  setState(() {});
                },
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                              children: [
                                Column(
                                  children: [
                                    commonTextFormField(
                                        controller: txtCurrentNewsController,
                                        hintTex: currentNews),
                                    commonButtons(
                                        lable: const Text(submit),
                                        onPress: () async {
                                          await currentNewsFirebase
                                              .ref('Current News')
                                              .child(currentNewsDetails[index]
                                                  ['key'])
                                              .update({
                                            'currentNews':
                                                txtCurrentNewsController.text,
                                          });
                                          showCurrentNews();
                                          currentNewsDetails.clear();
                                          setState(() {});
                                        }),
                                  ],
                                )
                              ],
                            ));
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: yellow50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all()),
                    child: Text(
                      currentNewsDetails[index]['currentNews'],
                      style: commonStyle(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map> currentNewsDetails = [];
