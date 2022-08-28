import 'package:global_knowledge_school/common_package.dart';

class FeesPay extends StatefulWidget {
  const FeesPay({Key? key}) : super(key: key);

  @override
  State<FeesPay> createState() => _FeesPayState();
}

class _FeesPayState extends State<FeesPay> {
  TextEditingController txtPayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(feesPay, style: headingStyle()),
          backgroundColor: green300,
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentPage(),
                  ),
                );
              },
              icon: Icon(icArrowBack))),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: Screens.height(context) * 0.011),
            Card(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              child: Container(
                height: Screens.height(context) * 0.26,
                width: Screens.width(context) * double.infinity,
                decoration: BoxDecoration(
                    color: yellow50, borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '  Total \nAmount',
                              style: commonStyle(),
                            ),
                            Text(
                              'Rs. 14,000',
                              style: commonStyle(),
                            )
                          ],
                        ),
                        Container(
                          height: Screens.height(context) * 0.13,
                          width: Screens.width(context) * 0.009,
                          color: black,
                        ),
                        Column(
                          children: [
                            Text(
                              '   Paid \nAmount',
                              style: commonStyle(fontColor: purple),
                            ),
                            Text(
                              'Rs. 14,000',
                              style: commonStyle(fontColor: purple),
                            )
                          ],
                        ),
                        Container(
                          height: Screens.height(context) * 0.13,
                          width: Screens.width(context) * 0.009,
                          color: black,
                        ),
                        Column(
                          children: [
                            Text(
                              'Remaining \n  Amount',
                              style: commonStyle(fontColor: red),
                            ),
                            Text(
                              'Rs. 0.00',
                              style: commonStyle(fontColor: red),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: Screens.height(context) * 0.006,
                      width: double.infinity,
                      color: black,
                    ),
                    commonButtons(
                        lable: Text(payNow, style: commonStyle()),
                        onPress: () {
                          setState(
                            () {
                              showDialog(
                                context: context,
                                builder: (context) => SimpleDialog(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                  contentPadding: const EdgeInsets.all(30.0),
                                  insetPadding: const EdgeInsets.symmetric(
                                    vertical: 120,
                                  ),
                                  children: [
                                    Column(
                                      children: [
                                        TextFormField(
                                          controller: txtPayController,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: black),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: enterATM),
                                        ),
                                        verticalSpace(
                                            vertical:
                                                Screens.height(context) * 0.03),
                                        commonButtons(
                                          lable: Text(
                                            feesSubmit,
                                            style: commonStyle(),
                                          ),
                                          onPress: () {
                                            Navigator.pop(context);
                                            // FirebaseApi
                                            //         .allFeesList[profile1['fees']]
                                            //     ['key'];

                                            // razorpay.open({
                                            //   'key': 'rzp_test_oJIEja6mh1WovB',
                                            //   'amount':
                                            //       int.parse(paycontroller.text) *
                                            //           100,
                                            //   'name': 'Jinal',
                                            //   'description': 'Fees',
                                            //   'prefill': {
                                            //     'contact': '8511516706',
                                            //     'email': 'jinalg98@gmail.com'
                                            //   }
                                            // });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Screens.height(context) * 0.06,
            ),
            // Card(
            //   shape:
            //       OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            //   child: Container(
            //     height: Screens.height(context) * 0.28,
            //     width: Screens.width(context) * double.infinity,
            //     color: yellow50,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(left: 100.0),
            //           child: Text(
            //             receiptDetails,
            //             style: headingStyle(),
            //           ),
            //         ),
            //         const SizedBox(height: 15),
            //         Text(
            //           '  Name :- Rahul Bhuva',
            //           style: commonStyle(),
            //         ),
            //         Text(
            //           '  Roll No. :- 201503100510026',
            //           style: commonStyle(),
            //         ),
            //         Text(
            //           '  Receipt No.:-123 ',
            //           style: commonStyle(),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 110.0, top: 15),
            //           child: commonButtons(
            //               lable: Text(
            //                 'View',
            //                 style: commonStyle(),
            //               ),
            //               onPress: () {}),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
