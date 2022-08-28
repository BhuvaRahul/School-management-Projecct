import 'package:global_knowledge_school/common_package.dart';

// ignore: must_be_immutable
class ShowHomework extends StatefulWidget {
  List homework;
  int homeworkIndex;

  ShowHomework({Key? key, required this.homeworkIndex, required this.homework})
      : super(key: key);

  @override
  State<ShowHomework> createState() => _ShowHomeworkState();
}

class _ShowHomeworkState extends State<ShowHomework> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Text(
        homework,
        style: headingStyle(),
      )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Expanded(
            child: ListView.builder(
              itemCount:
                  homeworkShow[widget.homeworkIndex]['homeworkList'].length,
              itemBuilder: (context, index) => Card(
                elevation: 3,
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  // height: Screens.height(context) * .14,
                  decoration: BoxDecoration(
                      color: yellow50, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Std :-" +
                                homeworkShow[widget.homeworkIndex]
                                    ['homeworkList'][index]['std'],
                            style: commonStyle(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      Text(
                        "Sub :-" +
                            homeworkShow[widget.homeworkIndex]['homeworkList']
                                [index]['sub'],
                        style: headingStyle(),
                      ),
                      Text(
                        "Description :-" +
                            homeworkShow[widget.homeworkIndex]['homeworkList']
                                [index]['description'],
                        style: subTitleStyle(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
