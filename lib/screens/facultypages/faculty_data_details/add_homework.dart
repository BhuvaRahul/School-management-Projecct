import 'package:global_knowledge_school/common_package.dart';

// ignore: must_be_immutable
class HDetails extends StatefulWidget {
  int i;

  HDetails({Key? key, required this.i}) : super(key: key);

  @override
  State<HDetails> createState() => _HDetailsState();
}

class _HDetailsState extends State<HDetails> {
  TextEditingController txtSubController = TextEditingController();
  TextEditingController txtDesController = TextEditingController();
  String? selectedStd;
  homeworkClear(){
    txtSubController.clear();
    txtDesController.clear();
    selectedStd=null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Text(
        'Home Work',
        style: headingStyle(),
      )),
      floatingActionButton: commonFloatingActionButton(onPress: () {
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            title: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) => Column(
                children: [
                  DropdownButton(
                    value: selectedStd,
                    items: [
                      for (int i = 0; i < homeworkShow.length; i++)
                        DropdownMenuItem(
                          child: Text(homeworkShow[i]['std']),
                          value: homeworkShow[i]['std'],
                        )
                    ],
                    elevation: 6,
                    onTap: () {
                      setState(() {});
                    },
                    onChanged: (value) => setState(() {
                      selectedStd = value.toString();
                    }),
                    hint: const Text(std),
                  ),
                  horizontalSpace(horizontal: 30),
                  commonTextFormField(
                    controller: txtSubController,
                    hintTex: homeWorkSubject,
                  ),
                  commonTextFormField(
                    controller: txtDesController,
                    hintTex: description,
                    keyBordTypes: TextInputType.multiline,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      commonButtons(
                          minWidths: 110,
                          lable: const Text(cancel),
                          onPress: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          }),
                      commonButtons(
                          minWidths: 110,
                          lable: const Text(submit),
                          onPress: () {
                            for (int i = 0; i < homeworkShow.length; i++) {
                              if (selectedStd == homeworkShow[i]['std']) {
                                homeworkShow[i]['homeworkList'].add({
                                  'std': selectedStd,
                                  'sub': txtSubController.text,
                                  'description': txtDesController.text,
                                });
                              }
                            }
                            homeworkClear();
                            setState(() {
                              Navigator.pop(context);
                            });
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
        setState(() {});
      }),
      body: GridView.builder(
          itemCount: homeworkShow.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 50,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3),
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowHomework(
                              homeworkIndex: index,
                              homework: homeworkShow[widget.i]['homeworkList'],
                            )),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: yellow50,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(homeworkShow[index]['std'].toString())),
                ),
              )),
    );
  }
}

// ignore: must_be_immutable
class AddHomework extends StatefulWidget {
  int index;

  AddHomework({Key? key, required this.index}) : super(key: key);

  @override
  State<AddHomework> createState() => _AddHomeworkState();
}

class _AddHomeworkState extends State<AddHomework> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        lable: Text(
          addHomework,
          style: headingStyle(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: homeworkShow[widget.index]['homeworkList'].length,
                  itemBuilder: (context, index) => Dismissible(
                    key: Key(homeworkShow[widget.index]['homeworkList'][index]),
                    onDismissed: (direction) {
                      homeworkShow[widget.index]['homeworkList']
                          .removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Delete...'),
                        duration: Duration(),
                      ));
                    },
                    child: Card(
                      elevation: 3,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: yellow50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Std :-" +
                                      homeworkShow[widget.index][index]['std'],
                                  style: commonStyle(),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            Text(
                              "Sub :-" +
                                  homeworkShow[widget.index][index]['sub'],
                              style: headingStyle(),
                            ),
                            Text(
                              "Description :-" +
                                  homeworkShow[widget.index][index]
                                      ['description'],
                              style: subTitleStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


List<Map> homeworkShow = [
  {'std': '1-A', 'homeworkList': []},
  {'std': '1-B', 'homeworkList': []},
  {'std': '1-C', 'homeworkList': []},
  {'std': '2-A', 'homeworkList': []},
  {'std': '2-B', 'homeworkList': []},
  {'std': '2-C', 'homeworkList': []},
  {'std': '3-A', 'homeworkList': []},
  {'std': '3-B', 'homeworkList': []},
  {'std': '3-C', 'homeworkList': []},
  {'std': '4-A', 'homeworkList': []},
  {'std': '4-B', 'homeworkList': []},
  {'std': '4-C', 'homeworkList': []},
  {'std': '5-A', 'homeworkList': []},
  {'std': '5-B', 'homeworkList': []},
  {'std': '5-C', 'homeworkList': []},
  {'std': '6-A', 'homeworkList': []},
  {'std': '6-B', 'homeworkList': []},
  {'std': '6-C', 'homeworkList': []},
  {'std': '7-A', 'homeworkList': []},
  {'std': '7-B', 'homeworkList': []},
  {'std': '7-C', 'homeworkList': []},
  {'std': '8-A', 'homeworkList': []},
  {'std': '8-B', 'homeworkList': []},
  {'std': '8-C', 'homeworkList': []},
  {'std': '9-A', 'homeworkList': []},
  {'std': '9-B', 'homeworkList': []},
  {'std': '9-C', 'homeworkList': []},
  {'std': '10-A', 'homeworkList': []},
  {'std': '10-B', 'homeworkList': []},
  {'std': '10-C', 'homeworkList': []},
  {'std': '11 Com-A', 'homeworkList': []},
  {'std': '11 Com-B', 'homeworkList': []},
  {'std': '11 Com-C', 'homeworkList': []},
  {'std': '12 Com-A', 'homeworkList': []},
  {'std': '12 Com-B', 'homeworkList': []},
  {'std': '12 Com-C', 'homeworkList': []},
  {'std': '11 Sci-A', 'homeworkList': []},
  {'std': '11 Sci-B', 'homeworkList': []},
  {'std': '11 Sci-C', 'homeworkList': []},
  {'std': '12 Sci-A', 'homeworkList': []},
  {'std': '12 Sci-B', 'homeworkList': []},
  {'std': '12 Sci-C', 'homeworkList': []},
];
