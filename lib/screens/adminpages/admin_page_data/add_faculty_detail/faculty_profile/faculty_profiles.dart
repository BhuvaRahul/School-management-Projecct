import 'package:global_knowledge_school/common_package.dart';

// ignore: must_be_immutable
class FacultyName extends StatelessWidget {
  int index;
  List fData;

  FacultyName({Key? key, required this.index, required this.fData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Row(
        children: [
          Text(fData[index]['name'],
              style: headingStyle()),
          horizontalSpace(horizontal: Screens.width(context) * 0.02),
          Text(fData[index]['surname'],
              style: headingStyle())
        ],
      )),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: white,
                backgroundImage: AssetImage('assets/images/school logo.png'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                smallContainer(
                  width: 150,
                  width1: 85,
                  label: const Text(facultyName),
                  text: Text(
                      // addFac = LogInSharedPrefrence.getAddFacName.toString(),
                      fData[index]['name'].toString(),
                      style: subTitleStyle()),
                ),
                smallContainer(
                    width: 150,
                    width1: 60,
                    label: const Text(surname),
                    text: Text(
                        fData[index]['surname'].toString(),
                        style: subTitleStyle()))
              ],
            ),
            smallContainer(
              width1: 110,
              label: const Text(facultyMobile),
              text: Text(
                  fData[index]['mobile'].toString(),
                  style: subTitleStyle()),
            ),
            smallContainer(
              width1: 45,
              label: const Text(facultyEmail),
              text: Text(
                 fData[index]['email'].toString(),
                  style: subTitleStyle()),
            ),
            smallContainer(
              width1: 80,
              label: const Text(facultyDepartment),
              text: Text(fData[index]['department'].toString(),
                  style: subTitleStyle()),
            ),
          ],
        ),
      ),
    );
  }
}
