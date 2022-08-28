import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/publicpages/public_page/public_page_list.dart';

class Amenities {
  Widget ame;

  Amenities({required this.ame});
}

List data = [
  Amenities(
    ame: SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: green300,
          title: Text(library, style: headingStyle()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AutoSizeText(welcomeLibrary,
                  style: headingStyle(styleColor: pink, styleSize: 23)),
              const Divider(color: black, thickness: 2),
              const AutoSizeText(libraryData),
              const Divider(color: black, thickness: 2),
              Table(
                border: TableBorder.all(color: black, width: 2),
                children: List.generate(
                  datas.length,
                      (index) {
                    return TableRow(
                      children: datas[index].values.map((e) {
                        return Center(child: Text(e));
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ), // libraries
  Amenities(
    ame: SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text(transportation, style: headingStyle()),
          backgroundColor: green300,
        ),
        body: Column(
          children: const [
            SizedBox(height: 10),
            Image(
              image: AssetImage('assets/images/schoolbus1.png'),
            ),
            SizedBox(height: 15),
            AutoSizeText(
              transportationData,
              presetFontSizes: [16, 15, 14],
            )
          ],
        ),
      ),
    ),
  ), // Transportation
  Amenities(
    ame: SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: green300,
          title: Text(hostel, style: headingStyle()),
        ),
        body: Column(
          children: [
            CarouselSlider(
              items: const [
                Image(
                  image: AssetImage('assets/images/hostel1.png'),
                ),
                Image(
                  image: AssetImage('assets/images/hostel.png'),
                ),
                Image(
                  image: AssetImage('assets/images/hostel2.png'),
                ),
                Image(
                  image: AssetImage('assets/images/hostel3.png'),
                ),
                Image(
                  image: AssetImage('assets/images/hostel4.png'),
                ),
              ],
              options: CarouselOptions(
                enlargeCenterPage: true,
              ),
            ),
            const AutoSizeText(
              hostelData,
              presetFontSizes: [17, 16, 14],
            ),
          ],
        ),
      ),
    ),
  ), // Hostels
  Amenities(
    ame: SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: green300,
          title: Text(sport, style: headingStyle()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AutoSizeText(
                sportData,
                presetFontSizes: [15, 16, 14],
              ),
              verticalSpace(vertical: 15),
              const AutoSizeText(
                sportData2,
                presetFontSizes: [15, 16, 14],
              ),
              verticalSpace(vertical: 11),
              CarouselSlider(
                items: const [
                  Image(
                      image: AssetImage('assets/images/sp.png'),
                      fit: BoxFit.cover),
                  Image(
                      image: AssetImage('assets/images/sp1.png'),
                      fit: BoxFit.cover),
                  Image(
                      image: AssetImage('assets/images/sp2.png'),
                      fit: BoxFit.cover),
                  Image(
                      image: AssetImage('assets/images/ground.png'),
                      fit: BoxFit.cover),
                  Image(
                      image: AssetImage('assets/images/sp4.png'),
                      fit: BoxFit.cover),
                ],
                options: CarouselOptions(
                  enlargeCenterPage: true,
                ),
              ),
              verticalSpace(vertical: 11),
              const AutoSizeText(
                sportData3,
                presetFontSizes: [15, 14, 13],
              ),
              const AutoSizeText(
                sportData4,
                presetFontSizes: [15, 14, 13],
              )
            ],
          ),
        ),
      ),
    ),
  ), // Sports
  Amenities(
    ame: SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: green300,
          title: Text(wifi, style: headingStyle()),
        ),
        body: Column(
          children: const [AutoSizeText(wifiData)],
        ),
      ),
    ),
  ), // WI-FI
  Amenities(
    ame: SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: green300,
          title: Text(
            auditorium,
            style: headingStyle(),
          ),
        ),
        body: Column(
          children: [
            CarouselSlider(
              items: const [
                Image(
                  image: AssetImage('assets/images/ad.png'),
                ),
                Image(
                  image: AssetImage('assets/images/ad1.png'),
                ),
                Image(
                  image: AssetImage('assets/images/ad2.png'),
                ),
                Image(
                  image: AssetImage('assets/images/ad4.png'),
                ),
                Image(
                  image: AssetImage('assets/images/hall.png'),
                ),
              ],
              options: CarouselOptions(
                enlargeCenterPage: true,
              ),
            ),
            Table(
              border: TableBorder.all(color: black, width: 2),
              children: List.generate(
                audit.length,
                    (index) {
                  return TableRow(
                    children: audit[index].values.map((e) {
                      return Text(
                        e,
                        textAlign: TextAlign.center,
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  ), // Auditorium
];
