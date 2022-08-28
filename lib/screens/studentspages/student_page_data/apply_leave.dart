import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/network/applyLeaveFirebase.dart';
// import 'package:global_knowledge_school/network/hostelApply_Firebase.dart';

TextEditingController name = TextEditingController();
TextEditingController std = TextEditingController();
TextEditingController classes = TextEditingController();
TextEditingController reason = TextEditingController();
DateTime initialDate = DateTime.now();
DateTime selectedDate = DateTime.now();
DateTime intialDate1 = DateTime.now();
DateTime selectedDate2 = DateTime.now();

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({Key? key}) : super(key: key);

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showLeaveApply();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppbar(
            lable: Text(
          applyLeave,
          style: headingStyle(),
        )),
        body: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              commonTextFormField(
                controller: name,
                hintTex: names,
              ),
              Row(
                children: [
                  Expanded(
                    child: commonTextFormField(
                        keyBordTypes: TextInputType.number,
                        controller: std,
                        hintTex: studentStd),
                  ),
                  Expanded(
                    child: commonTextFormField(
                        controller: classes, hintTex: studentClass),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(10),
                height: Screens.height(context) * 0.12,
                // width: Screens.width(context)*10,
                decoration: BoxDecoration(
                    border: Border.all(color: black),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedDate.day.toString() +
                            '/' +
                            selectedDate.month.toString() +
                            '/' +
                            selectedDate.year.toString()),
                        const Text(to),
                        Text(selectedDate2.day.toString() +
                            '/' +
                            selectedDate2.month.toString() +
                            '/' +
                            selectedDate2.year.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          onPressed: () async {
                            selectedDate = (await showDatePicker(
                                helpText: 'Select Leave date',
                                cancelText: 'CANCEL',
                                confirmText: 'OK',
                                context: context,
                                initialDate: initialDate,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(3000)))!;
                            setState(() {});
                          },
                          child: Icon(
                            icCalender,
                            color: black,
                          ),
                        ),
                        const Text(form),
                        Icon(
                          icRightArrow,
                          size: 40,
                        ),
                        const Text(to),
                        MaterialButton(
                          colorBrightness: Brightness.dark,
                          onPressed: () async {
                            selectedDate2 = (await showDatePicker(
                              helpText: 'Select booking date',
                              cancelText: 'CANCEL',
                              confirmText: 'OK',
                              context: context,
                              initialDate: intialDate1,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(3000),
                            ))!;
                            setState(() {});
                          },
                          child: Icon(
                            icCalender,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              commonTextFormField(
                  controller: reason, obsecurText: false, hintTex: reasons),
              commonButtons(
                  lable: Text(
                    submit,
                    style: commonStyle(),
                  ),
                  onPress: () {
                    addApplyLeave();
                    leaveList.clear();
                    showLeaveApply();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map> leaveList = [];
