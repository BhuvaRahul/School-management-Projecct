import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/publicpages/public_page/public_page_list.dart';

class GlobalSchool extends StatefulWidget {
  const GlobalSchool({Key? key}) : super(key: key);

  @override
  State<GlobalSchool> createState() => _GlobalSchoolState();
}

class _GlobalSchoolState extends State<GlobalSchool> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: green300,
          title: AutoSizeText(highSchool,
              presetFontSizes: const [23, 22, 20],
              style: headingStyle(styleColor: black)
              //TextStyle(color:Colors.black),
              ),
          actions: [
            Container(
                width: Screens.width(context) * 0.17,
                decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                child: Image.asset('assets/images/school logo.png'))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(vertical: 10),
              CarouselSlider.builder(
                itemCount: school.length,
                itemBuilder: (context, index, ib) => Image(
                  image: AssetImage(school[index]['image']),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: Screens.height(context) * 0.32,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                ),
              ),
              verticalSpace(vertical: Screens.height(context) * 0.02),
              Stack(
                children: [
                  Container(
                    height: Screens.height(context) * 0.463,
                    width: Screens.width(context) * 0.95,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: black12,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: black, width: 2)),
                    child: Column(
                      children: [
                        verticalSpace(
                            vertical: Screens.height(context) * 0.068),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: admissionData.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (index == 1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AdmissionApply()));
                                  }
                                },
                                child: Container(
                                  height: Screens.height(context) * 0.08,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          if (index == 1)
                                            const Icon(Icons.calendar_today),
                                          if (index == 2)
                                            const Icon(Icons.calendar_today),
                                          if (index == 3)
                                            const Icon(Icons.phone),
                                          Text(
                                            admissionData[index]['tlt'],
                                            style: commonStyle(),
                                          ),
                                        ],
                                      ),
                                      if (index == 3)
                                        const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(phoneNo + phoneNo1))
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    verticalSpace(vertical: 9)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Container(
                      height: Screens.height(context) * 0.082,
                      width: Screens.width(context) * 0.52,
                      decoration: BoxDecoration(
                          color: green300,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: black, width: 2)),
                      child: Row(
                        children: [
                          Icon(icAccessTime, size: 35),
                          lables(lable: admission, style: headingStyle()),
                        ],
                      ),
                    ),
                  )
                ],
              ), // Admission
              verticalSpace(vertical: Screens.height(context) * 0.02),
              Stack(
                children: [
                  Container(
                    height: Screens.height(context) * 0.275,
                    width: Screens.width(context) * 0.95,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: black12,borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: black, width: 2)),
                    child: Column(
                      children: [
                        verticalSpace(vertical: Screens.height(context) * 0.05),
                        Expanded(
                          child: ListView.builder(
                            itemCount: news.length,
                            itemBuilder: (context, index) => ListTile(
                              leading: Icon(
                                icSchool,
                                size: 29,
                                color: black,
                              ),
                              title: AutoSizeText(
                                news[index]['news'],
                                style: const TextStyle(fontSize: 15),
                              ),
                              onTap: () {
                                if (index == 0) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const First()));
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Container(
                      height: Screens.height(context) * 0.082,
                      width: Screens.width(context) * 0.55,
                      decoration: BoxDecoration(
                          color: green300,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: black, width: 2)),
                      child: Row(
                        children: [
                          Icon(icNewsPaperOutlined, size: 35),
                          lables(
                            lable: currentNews,
                            style: headingStyle(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ), // Current News
              verticalSpace(vertical: Screens.height(context) * 0.02),
              Stack(
                children: [
                  Container(
                    height: Screens.height(context) * 0.475,
                    width: Screens.width(context) * 0.95,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: black12,borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: black, width: 2)),
                    child: Column(
                      children: [
                        verticalSpace(vertical: Screens.height(context) * 0.06),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: Screens.height(context) * 0.11,
                              width: Screens.width(context) * 0.013,
                              color: black,
                            ),
                            Column(
                              children: const [
                                AutoSizeText(
                                  welcome,
                                  presetFontSizes: [19, 17, 16],
                                ),
                                AutoSizeText(
                                  globalKnowledge,
                                  presetFontSizes: [19, 17, 16],
                                )
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          color: black,
                        ),
                        const AutoSizeText(
                          visitText,
                          presetFontSizes: [16, 15, 14],
                        ),
                        verticalSpace(vertical: Screens.height(context) * 0.02),
                        const AutoSizeText(
                          visitText2,
                          presetFontSizes: [16, 15, 14],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Container(
                      height: Screens.height(context) * 0.082,
                      width: Screens.width(context) * 0.52,
                      decoration: BoxDecoration(
                          color: green300,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: black, width: 2)),
                      child: Row(
                        children: [
                          Icon(icHome, size: 35),
                          lables(
                            lable: planVisit,
                            style: headingStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ), // Plan A Visit
              verticalSpace(vertical: Screens.height(context) * 0.05),
              AutoSizeText(
                amenitiesTitle,
                style: headingStyle(styleSize: 25),
              ),
              const AutoSizeText(
                amenitiesSubTitle,
                presetFontSizes: [16, 15, 14],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: amenities.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Container(
                    height: Screens.height(context) * 0.2,
                    width: Screens.width(context) * 0.2,
                    decoration: BoxDecoration(
                      color: yellow50,
                      border: Border.all(color: pink, width: 1),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                    ),
                    child: Icon(
                      amenities[index]['icon'],
                      size: 35,
                      color: black,
                    ),
                  ),
                  title: Text(
                    amenities[index]['title'],
                    style: const TextStyle(color: pink, fontSize: 19),
                  ),
                  subtitle: AutoSizeText(
                    amenities[index]['subtitle'],
                    presetFontSizes: const [14, 15, 13],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => data[index].ame),
                    );
                  },
                ),
              ),
              verticalSpace(vertical: Screens.height(context) * 0.02),
              GridView.builder(
                shrinkWrap: true,
                itemCount: abt.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    childAspectRatio: 8 / 7,
                    mainAxisSpacing: 8),
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(border: Border.all(color: black)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 39,
                        backgroundImage: AssetImage(abt[index]['img']),
                      ),
                      Text(
                        abt[index]['tlt'],
                        style: commonStyle(fontColor: pink),
                      ),
                      Text(
                        abt[index]['stlt'],
                        style: commonStyle(fontColor: pink),
                      )
                    ],
                  ),
                ),
              ),
              verticalSpace(vertical: Screens.height(context) * 0.02),
              Padding(
                padding: const EdgeInsets.only(right: 159.0),
                child: Text(
                  whyChooseUs,
                  style: headingStyle(),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: why.length,
                itemBuilder: (context, index) => ExpansionTile(
                  title: Text(
                    why[index]['choose'],
                    style: commonStyle(fontColor: blue),
                  ),
                  trailing: Icon(
                    icAdd,
                    color: pink,
                  ),
                  children: [
                    lables(lable: why[index]['txt1']),
                    lables(lable: why[index]['txt2'])
                  ],
                ),
              ),
              verticalSpace(vertical: Screens.height(context) * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  lables(lable: mission, presetSize: [19,17,18]),
                  lables(lable: missionData),
                  verticalSpace(vertical: Screens.height(context) * 0.01),
                  lables(lable: vision,  presetSize: [19,17,18]),
                  lables(lable: visionData),
                  verticalSpace(vertical: Screens.height(context) * 0.01),
                  lables(lable: objective, presetSize: [19,17,18]),
                  lables(lable: objectiveData),
                  lables(lable: objectiveData2),
                  lables(lable: objectiveData3),
                ],
              ),
              ExpansionTile(
                title: const Text(feeStructure),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(fee.length, (i) {
                      return GestureDetector(
                        onTap: () {
                          if (i == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const First()));
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          height: Screens.height(context) * 0.075,
                          width: double.infinity,
                          color: yellow,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 13.0),
                            child: Text(
                              fee[i]['fees'],
                              style: commonStyle(fontSizes: 17),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}