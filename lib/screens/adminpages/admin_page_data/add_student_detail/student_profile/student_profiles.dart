import 'package:global_knowledge_school/common_package.dart';

// ignore: must_be_immutable
class StudentName extends StatelessWidget {
  List data;
  int index;

  StudentName({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        lable: Row(
          children: [
            Text(data[index]['name'].toString(), style: headingStyle()),
            horizontalSpace(horizontal: Screens.width(context) * 0.02),
            Text(data[index]['surname'].toString(), style: headingStyle()),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: white,
                backgroundImage: AssetImage('assets/images/campus.png'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                smallContainer(
                    width1: 70,
                    width: 150,
                    text: Text(data[index]['name'].toString(), style: subTitleStyle()),
                    label: const Text(facultyName)),
                smallContainer(
                    width1: 70,
                    width: 150,
                    text: Text(data[index]['surname'].toString(), style: subTitleStyle()),
                    label: const Text(surname))
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: smallContainer(
                      width1: 50,
                      width: 150,
                      text: Text(data[index]['std'].toString(), style: subTitleStyle()),
                      label: const Text(std)),
                ),
                Expanded(
                  child: smallContainer(
                      width1: 50,
                      width: 150,
                      text: Text(data[index]['gender'].toString()),
                      label: const Text(studentGender)),
                ),
              ],
            ),
            smallContainer(
              width1: 55,
              label: const Text(rollNo),
              text: Text(data[index]['rollNumber'].toString(), style: subTitleStyle()),
            ),
            smallContainer(
                width1: 110,
                text: Text(data[index]['mobile'].toString()),
                label: const Text(studentMobileNumber)),
            smallContainer(
                width1: 60,
                text: Text(data[index]['address'].toString()),
                label: const Text(address)),
          ],
        ),
      ),
    );
  }
}
