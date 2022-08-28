import 'package:global_knowledge_school/common_package.dart';

class TimeTablePage extends StatefulWidget {
  const TimeTablePage({Key? key}) : super(key: key);

  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

// const List<String> tabNames = <String>[
//   'Monday',
//   'Tuesday',
//   'Wednesday',
//   'Thursday',
//   'Friday',
//   'Saturday',
// ];

class _TimeTablePageState extends State<TimeTablePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Color color = red;
  bool teacher = true;
  bool edit = false;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, initialIndex: 0, length:1,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        lable: Text(
          timeTable,
          style: headingStyle(),
        ),
      ),
     body:
     TabBarView(
        controller: _tabController,
        children:[
           teacher == true ? const TeachersTimeTable() :  const StudentsTimeTable(),
        ]
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    teacher = true;
                    setState(() {});
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: teacher ? color : white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(teachers,
                          style:
                              commonStyle(fontColor: !teacher ? black : white)
                          ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    teacher = false;
                    setState(() {});
                  },
                  child: Container(
                    height: Screens.height(context) * 0.07,
                    decoration: BoxDecoration(
                        color: !teacher ? color : white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(students,
                          style: commonStyle(fontColor: teacher ? black : white)
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // AnimatedCrossFade(
          //   firstChild: Material(
          //     color: grey,
          //     child: TabBar(
          //       indicatorColor: white,
          //       controller: _tabController,
          //       isScrollable: true,
          //       tabs: List.generate(tabNames.length, (index) {
          //         return Card(
          //           elevation: 10,
          //           shape: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(20)),
          //           child: Container(
          //             height: Screens.height(context)*0.065,
          //             width: Screens.width(context) * 0.32,
          //             decoration: BoxDecoration(
          //               color: Colors.grey.shade300,
          //               borderRadius: BorderRadius.circular(20),
          //             ),
          //             child: Center(
          //               child: Text(
          //                 tabNames[index].toUpperCase(),
          //                 style: commonStyle()
          //               ),
          //             ),
          //           ),
          //         );
          //       }),
          //     ),
          //   ),
          //   secondChild: Container(),
          //   crossFadeState: CrossFadeState.showFirst,
          //   duration: const Duration(milliseconds: 300),
          // ),
        ],
      ),
    );
  }
}
