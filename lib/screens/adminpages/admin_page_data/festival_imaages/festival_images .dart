// ignore_for_file: file_names
import 'dart:io';
import 'package:global_knowledge_school/common_package.dart';
import 'package:image_picker/image_picker.dart';

List<XFile>? imageFiles;

class FestivalImages extends StatefulWidget {
  const FestivalImages({Key? key}) : super(key: key);

  @override
  State<FestivalImages> createState() => _FestivalImagesState();
}

class _FestivalImagesState extends State<FestivalImages> {
  String? selectedFestival;

  openImages() async {
    final ImagePicker imgPicker = ImagePicker();
    var pickedFiles = await imgPicker.pickMultiImage();
    if (pickedFiles != null) {
      imageFiles = pickedFiles;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          festivalImages,
          style: headingStyle(),
        ),
        backgroundColor: green300,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            //barrierDismissible: false,
            context: context,
            builder: (context) {
              int i = 0;
              return SimpleDialog(
                children: [
                  StatefulBuilder(
                    builder: (context, setState) => Column(
                      children: [
                        DropdownButton(
                          value: selectedFestival,
                          items: [
                            for (int i = 0; i < festivalImg.length; i++)
                              DropdownMenuItem(
                                value: festivalImg[i]['festival'],
                                child: Text(festivalImg[i]['festival']),
                              ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedFestival = value.toString();
                              print('-----------------$selectedFestival');
                            });
                          },
                          elevation: 6,
                          hint: const Text(festivalImages),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              print('${festivalImg[i]}');
                              festivalImg[i]['imageList'].add(imageFiles);
                              // for (int i = 0;
                              // i <= festivalImg.length;
                              // i++) {
                              //   if (selectedFestival ==
                              //       festivalImg[i]['festival']) {
                              //     festivalImg[i]['imageList'].add({imageFiles});
                              //   }
                              // }
                              openImages();
                            });
                          },
                          child: Text(
                            addImages,
                            style: commonStyle(),
                          ),
                          color: yellow50,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            commonButtons(
                                lable: const Text('Cancel'),
                                onPress: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                }),
                            commonButtons(
                                lable: const Text('Submit'),
                                onPress: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(icAdd),
        backgroundColor: green300,
      ),
      body: GridView.builder(
          itemCount: festivalImg.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 60),
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageClass(idx: index),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: yellow50,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  margin: const EdgeInsets.all(4),
                  child: Center(
                    child: Text(
                      festivalImg[index]['festival'],
                      style: commonStyle(),
                    ),
                  ),
                ),
              )),
    );
  }
}

List<Map> festivalImg = [
  {'festival': 'Diwali', 'imageList': []},
  {'festival': 'Holi', 'imageList': []},
  {'festival': 'Utrayan', 'imageList': []},
  {'festival': 'RakshaBandhan', 'imageList': []},
  {'festival': 'Janmastami', 'imageList': []},
  {'festival': 'Independence Day', 'imageList': []},
  {'festival': 'Ganesh Chaturthi', 'imageList': []},
  {'festival': 'Navratri', 'imageList': []},
  {'festival': 'Christmas', 'imageList': []},
  {'festival': 'Republic Day', 'imageList': []},
];

// ignore: must_be_immutable
class ImageClass extends StatefulWidget {
  int idx;

  ImageClass({Key? key, required this.idx}) : super(key: key);

  @override
  State<ImageClass> createState() => _ImageClassState();
}

class _ImageClassState extends State<ImageClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: imageFiles!.isNotEmpty ||
                imageFiles == festivalImg[widget.idx]['imageList']
            ?
            //   ListView.builder(
            //     itemCount: festivalImg[widget.idx]['imageList'].length,
            //     itemBuilder: (context, index) =>
            //         Card(
            //           child: SizedBox(
            //             height: 100,
            //             width: 100,
            //             child: Image.file(
            //                 File(festivalImg[widget.idx]['imageList'].path.toString()),
            //           ),
            //         ),
            //   ),
            // )
            Column(
                children: imageFiles!.map<Widget>((imageOne) {
                  return Card(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.file(
                        File(imageOne.path.toString()),
                      ),
                    ),
                  );
                }).toList(),
              )
            : Container());
  }
}
