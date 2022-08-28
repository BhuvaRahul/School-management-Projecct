import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/network/hostelApply_Firebase.dart';

TextEditingController txtHostelNameController = TextEditingController();
TextEditingController txtHostelMobilenoController = TextEditingController();
TextEditingController txtHostelEmailController = TextEditingController();
TextEditingController txtHostelStdController = TextEditingController();
TextEditingController txtHostelClasssController = TextEditingController();
TextEditingController txtHostelRollController = TextEditingController();

class HostelApply extends StatefulWidget {
  const HostelApply({Key? key}) : super(key: key);

  @override
  State<HostelApply> createState() => _HostelApplyState();
}

class _HostelApplyState extends State<HostelApply> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showHostelApply();
    hostelApplyDetails.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppbar(
          lable: Text(
            hostelApply,
            style: headingStyle(),
          ),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              commonTextFormField(
                controller: txtHostelNameController,
                hintTex: studentName,
              ),
              commonTextFormField(
                  controller: txtHostelMobilenoController,
                  hintTex: facultyMobile,
                  keyBordTypes: TextInputType.phone),
              commonTextFormField(
                  controller: txtHostelEmailController,
                  hintTex: facultyEmail,
                  keyBordTypes: TextInputType.emailAddress),
              Row(
                children: [
                  Expanded(
                    child: commonTextFormField(
                        controller: txtHostelStdController,
                        hintTex: studentStd,
                        keyBordTypes: TextInputType.number),
                  ),
                  Expanded(
                    child: commonTextFormField(
                      controller: txtHostelClasssController,
                      hintTex: studentClass,
                    ),
                  ),
                ],
              ),
              commonTextFormField(
                controller: txtHostelRollController,
                hintTex: rollNo,
              ),
              commonButtons(
                lable: const Text(submit),
                onPress: () {
                  addHostelApply();
                  hostelApplyDetails.clear();
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Map> hostelApplyDetails = [];
