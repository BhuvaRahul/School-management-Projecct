import 'package:global_knowledge_school/common_package.dart';

class HostelApplyDetails extends StatefulWidget {
  const HostelApplyDetails({Key? key}) : super(key: key);

  @override
  State<HostelApplyDetails> createState() => _HostelApplyDetailsState();
}

class _HostelApplyDetailsState extends State<HostelApplyDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppbar(
            lable: Text(
          'Hostel Apply Details',
          style: headingStyle(),
        )),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: hostelApplyDetails.length,
                itemBuilder: (context, index) => Dismissible(
                  key: Key(hostelApplyDetails[index]['name']),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    hostelApplyDetails.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item Delete'),
                      ),
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HostelDetails(
                              index: index,
                            ),
                          ));
                    },
                    child: Card(
                      elevation: 3,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: Screens.height(context) * 0.076,
                        decoration: BoxDecoration(
                            color: yellow50,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Text(
                            hostelApplyDetails[index]['name'],
                            style: subTitleStyle(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
                height: 50,
                height1: 20,
                width1: 120,
                left: 35,
                text: Text(hostelApplyDetails[widget.index]['name']),
                label: Text(studentName, style: subTitleStyle(fontColor: grey)),
              ),
              smallContainer(
                height: 50,
                height1: 20,
                width1: 130,
                left: 35,
                text: Text(hostelApplyDetails[widget.index]['mobileNumber']),
                label: Text(studentMobileNumber,
                    style: subTitleStyle(fontColor: grey)),
              ),
              smallContainer(
                height: 50,
                height1: 20,
                width1: 60,
                left: 35,
                text: Text(hostelApplyDetails[widget.index]['email']),
                label: Text(email, style: subTitleStyle(fontColor: grey)),
              ),
              Row(
                children: [
                  smallContainer(
                    height: 50,
                    height1: 20,
                    width1: 50,
                    width: 150,
                    left: 35,
                    text: Text(hostelApplyDetails[widget.index]['std']),
                    label: Text(std, style: subTitleStyle(fontColor: grey)),
                  ),
                  smallContainer(
                    height: 50,
                    height1: 20,
                    width1: 60,
                    width: 150,
                    left: 35,
                    text: Text(hostelApplyDetails[widget.index]['class']),
                    label: Text(studentClass,
                        style: subTitleStyle(fontColor: grey)),
                  ),
                ],
              ),
              smallContainer(
                height: 50,
                height1: 20,
                width1: 70,
                left: 35,
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
