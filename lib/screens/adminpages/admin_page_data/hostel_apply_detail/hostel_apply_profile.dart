import 'package:global_knowledge_school/common_package.dart';

// ignore: must_be_immutable
class HostelDetails extends StatefulWidget {
  int index;

  HostelDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<HostelDetails> createState() => _HostelDetailsState();
}

class _HostelDetailsState extends State<HostelDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppbar(
            lable: Text(
              hostelApplyDetails[widget.index]['name'],
              style: headingStyle(),
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              smallContainer(
                width1: 120,
                text: Text(hostelApplyDetails[widget.index]['name']),
                label: Text(studentName, style: subTitleStyle(fontColor: grey)),
              ),
              smallContainer(
                width1: 130,
                text: Text(hostelApplyDetails[widget.index]['mobileNumber']),
                label: Text(studentMobileNumber,
                    style: subTitleStyle(fontColor: grey)),
              ),
              smallContainer(
                width1: 60,
                text: Text(hostelApplyDetails[widget.index]['email']),
                label: Text(email, style: subTitleStyle(fontColor: grey)),
              ),
              Row(
                children: [
                  smallContainer(
                    width1: 50,
                    width: 150,
                    text: Text(hostelApplyDetails[widget.index]['std']),
                    label: Text(std, style: subTitleStyle(fontColor: grey)),
                  ),
                  smallContainer(
                    width1: 60,
                    width: 150,
                    text: Text(hostelApplyDetails[widget.index]['class']),
                    label: Text(studentClass,
                        style: subTitleStyle(fontColor: grey)),
                  ),
                ],
              ),
              smallContainer(
                width1: 70,
                text: Text(hostelApplyDetails[widget.index]['rollNo']),
                label: Text(
                  rollNo,
                  style: subTitleStyle(fontColor: grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
