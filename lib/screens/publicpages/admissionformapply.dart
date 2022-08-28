import 'package:firebase_database/firebase_database.dart';
import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/network/admissionformapplyFirebase.dart';

FirebaseDatabase firebase = FirebaseDatabase.instance;
TextEditingController txtStudNameController = TextEditingController();
TextEditingController txtStudClassController = TextEditingController();
TextEditingController txtStudFatherController = TextEditingController();
TextEditingController txtStudPhoneController = TextEditingController();
TextEditingController txtStudPhone1Controller = TextEditingController();
TextEditingController txtStudBirthController = TextEditingController();
TextEditingController txtStudAddressController = TextEditingController();
TextEditingController txtStudCityController = TextEditingController();
TextEditingController txtStudPinCodeController = TextEditingController();
TextEditingController txtStudEmailController = TextEditingController();

class AdmissionApply extends StatefulWidget {
  const AdmissionApply({Key? key}) : super(key: key);

  @override
  State<AdmissionApply> createState() => _AdmissionApplyState();
}

class _AdmissionApplyState extends State<AdmissionApply> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showAdmission();
    studApply.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Text(
        highSchool,
        style: headingStyle(),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonTextFormField(
                controller: txtStudNameController,
                hintTex: studentName,
                prefixIcons: Icon(icPerson)),
            commonTextFormField(
                controller: txtStudClassController,
                hintTex: classApply,
                prefixIcons: Icon(icHome)),
            commonTextFormField(
                controller: txtStudFatherController,
                hintTex: fatherName,
                prefixIcons: Icon(icPerson)),
            Row(
              children: [
                Expanded(
                  child: commonTextFormField(
                      controller: txtStudPhoneController,
                      hintTex: phone,
                      keyBordTypes: TextInputType.phone,
                      prefixIcons: Icon(icPhoneAndroid)),
                ),
                Expanded(
                  child: commonTextFormField(
                      controller: txtStudPhone1Controller,
                      hintTex: phone2,
                      keyBordTypes: TextInputType.phone,
                      prefixIcons: Icon(icPhoneAndroid)),
                ),
              ],
            ),
            commonTextFormField(
                controller: txtStudBirthController,
                hintTex: dob,
                keyBordTypes: TextInputType.number,
                prefixIcons: Icon(icDateRange)),
            commonTextFormField(
                controller: txtStudAddressController,
                hintTex: address,
                prefixIcons: Icon(icAddRoad)),
            Row(
              children: [
                Expanded(
                  child: commonTextFormField(
                      controller: txtStudCityController,
                      hintTex: city,
                      prefixIcons: Icon(icRealEstateAgent)),
                ),
                Expanded(
                  child: commonTextFormField(
                      controller: txtStudPinCodeController,
                      hintTex: pinCode,
                      keyBordTypes: TextInputType.phone,
                      prefixIcons: Icon(icLocationCity)),
                ),
              ],
            ),
            commonTextFormField(
                controller: txtStudEmailController,
                hintTex: email,
                keyBordTypes: TextInputType.emailAddress,
                prefixIcons: Icon(icEmailOutLined)),
            commonButtons(
                lable: const Text(submit),
                onPress: () {
                  addAdmission();
                  studApply.clear();
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}

List<Map> studApply = [];

class AdmissionApplyDetails extends StatefulWidget {
  const AdmissionApplyDetails({Key? key}) : super(key: key);

  @override
  State<AdmissionApplyDetails> createState() => _AdmissionApplyDetailsState();
}

class _AdmissionApplyDetailsState extends State<AdmissionApplyDetails> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Text(
        admissionApplyDetails,
        style: headingStyle(),
      )),
      body: studApply.isEmpty
          ? Container()
          : ListView.builder(
              itemCount: studApply.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key(studApply[index].toString()),
                onDismissed: (direction) {
                  firebase
                      .ref('admission')
                      .child(studApply[index]['key'].toString())
                      .remove();
                  studApply.removeAt(index);
                },
                child: Card(
                  elevation: 3,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ApplyDetails(index: index)));
                    },
                    child: Container(
                      height: Screens.height(context) * 0.075,
                      decoration: BoxDecoration(
                        color: yellow50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          studApply[index]['name'].toString(),
                          style: subTitleStyle(),
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

// ignore: must_be_immutable
class ApplyDetails extends StatefulWidget {
  int index;

  ApplyDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<ApplyDetails> createState() => _ApplyDetailsState();
}

class _ApplyDetailsState extends State<ApplyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        lable: Text(
          studApply[widget.index]['name'].toString(),
          style: headingStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            smallContainer(
              width1: 60,
              text: Text(studApply[widget.index]['name'].toString()),
              label: Text(name, style: subTitleStyle(fontColor: grey)),
            ),
            smallContainer(
              width1: 210,
              text: Text(studApply[widget.index]['class'].toString()),
              label: Text(classApply, style: subTitleStyle(fontColor: grey)),
            ),
            smallContainer(
              width1: 110,
              text: Text(studApply[widget.index]['father'].toString()),
              label: Text(fatherName, style: subTitleStyle(fontColor: grey)),
            ),
            Row(
              children: [
                smallContainer(
                  width1: 100,
                  width: 150,
                  text: Text(studApply[widget.index]['phone'].toString()),
                  label: Text(phone, style: subTitleStyle(fontColor: grey)),
                ),
                smallContainer(
                  width1: 100,
                  text: Text(studApply[widget.index]['phone1'].toString()),
                  width: 150,
                  label: Text(phone2, style: subTitleStyle(fontColor: grey)),
                ),
              ],
            ),
            smallContainer(
              width1: 60,
              // width: 150,
              // left: 35,
              text: Text(studApply[widget.index]['birth'].toString()),
              label: Text(dob1, style: subTitleStyle(fontColor: grey)),
            ),
            smallContainer(
              width1: 80,
              text: Text(studApply[widget.index]['address'].toString()),
              label: Text(address, style: subTitleStyle(fontColor: grey)),
            ),
            smallContainer(
                width1: 60,
                text: Text(studApply[widget.index]['city'].toString()),
                label: Text(
                  city,
                  style: subTitleStyle(fontColor: grey),
                )),
            smallContainer(
                width1: 80,
                text: Text(studApply[widget.index]['pinCode'].toString()),
                label: Text(
                  pinCode,
                  style: subTitleStyle(fontColor: grey),
                )),
            smallContainer(
              width1: 60,
              text: Text(studApply[widget.index]['email'].toString()),
              label: Text(
                email,
                style: subTitleStyle(fontColor: grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
