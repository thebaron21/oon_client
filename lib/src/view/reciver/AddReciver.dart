import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view_models/Recive/AddReciver_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:contact_picker/contact_picker.dart';

// class AddReciver extends StatefulWidget {
//   @override
//   _AddReciverState createState() => _AddReciverState();
// }
//
// class _AddReciverState extends State<AddReciver> {
//   ContactPicker _contactPicker = ContactPicker();
//   @override
//   void initState() {
//     super.initState();
//     initData();
//   }
//
//   initData() async {
//     SharedPreferences obj = await SharedPreferences.getInstance();
//     obj.setBool("isSender", false);
//   }
//
//   TextEditingController _name = TextEditingController();
//   TextEditingController _phone = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     double screenwidth = MediaQuery.of(context).size.width;
// //360
//     double screenhigh = MediaQuery.of(context).size.height;
//
//     double A;
//     double B;
//     double C;
//
//     if (MediaQuery.of(context).orientation == Orientation.portrait) {
//       A = screenwidth / 1.2;
//       B = screenwidth / 1.44;
//       C = screenwidth / 2.11;
//     } else {
//       A = screenwidth / 1.2;
//
//       B = screenwidth / 1.44;
//       C = screenwidth / 2.11;
//     }
//
//     return ViewModelBuilder.reactive(
//       builder: (BuildContext context, AddReciverViewModel model, Widget child) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: model.colorPattern.primaryColor,
//             centerTitle: true,
//             title: Container(
//               child: SvgPicture.asset(
//                 'assets/images/svg/ic_small_logo.svg',
//                 height: 40,
//               ),
//             ),
//             leadingWidth: 48,
//             leading: Container(
//               padding: EdgeInsets.all(8),
//               child: SvgPicture.asset(
//                 'assets/images/svg/ic_menu.svg',
//               ),
//             ),
//           ),
//           body: ListView(
//             children: [
//               ActionBar(
//                 title: 'إرسال',
//                 colorPattern: model.colorPattern,
//                 back: () {
//                   Navigator.of(context).pop();
//                   print("Back");
//                 },
//                 help: () {
//                   print("Back");
//                 },
//               ),
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   PageLogo(
//                     imagePath: 'assets/images/svg/ic_circle.svg',
//                     height: 60,
//                   ),
//                   Text(
//                     '1',
//                     style: TextStyle(fontSize: 45, color: Color(0xFFD0DD28)),
//                   )
//                 ],
//               ),
//               Center(
//                 child: Text(
//                   'إضافة مستلم',
//                   style: TextStyle(
//                     color: model.colorPattern.primaryColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24,
//                   ),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.bottomRight,
//                 margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
//                 child: Text('إسم جهة الإتصال'),
//               ),
//               Padding(padding: EdgeInsets.all(10)),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         width: A,
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Container(
//                               height: 30,
//                               width: A,
//                               child: TextField(
//                                 controller: _name,
//                                 cursorColor: Color(0XFFD0DD28),
//                                 textAlign: TextAlign.center,
//                                 decoration: new InputDecoration(
//                                   border: OutlineInputBorder(
//                                     borderRadius: const BorderRadius.all(
//                                       const Radius.circular(50.0),
//                                     ),
//                                   ),
//                                   fillColor: Colors.white,
//                                   filled: true,
//                                   hintTextDirection: TextDirection.rtl,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(50),
//                                     ),
//                                     borderSide: BorderSide(
//                                       width: 1,
//                                       color: Color(0XFFD0DD28),
//                                     ),
//                                   ),
//                                   hintText: "",
//                                   hintStyle: new TextStyle(
//                                     color: Color(0XFFD0DD28),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     InkWell(
//                                       onTap: () async {
//                                         Contact contact = await _contactPicker
//                                             .selectContact();
//                                         setState(() {
//                                           _name.text = contact.fullName;
//                                           _phone.text =
//                                               contact.phoneNumber.number;
//                                         });
//                                         model.changeInitValue(
//                                           contact.fullName,
//                                           contact.phoneNumber.number,
//                                         );
//                                       },
//                                       child: Image.asset(
//                                         'assets/images/png/TF.png',
//                                         height: 30,
//                                       ),
//                                     ),
//                                     Center(
//                                       child: Text(
//                                         '+',
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Padding(padding: EdgeInsets.all(5)),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         width: A,
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Container(
//                               height: 30,
//                               width: A,
//                               child: TextField(
//                                 cursorColor: Color(0XFFD0DD28),
//                                 textAlign: TextAlign.center,
//                                 controller: _phone,
//                                 decoration: new InputDecoration(
//                                     border: OutlineInputBorder(
//                                       borderRadius: const BorderRadius.all(
//                                         const Radius.circular(50.0),
//                                       ),
//                                     ),
//                                     fillColor: Colors.white,
//                                     filled: true,
//                                     hintTextDirection: TextDirection.rtl,
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(50)),
//                                       borderSide: BorderSide(
//                                         width: 1,
//                                         color: Color(0XFFD0DD28),
//                                       ),
//                                     ),
//                                     hintText: "",
//                                     hintStyle: new TextStyle(
//                                       color: Color(0XFFD0DD28),
//                                     )),
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {},
//                                       child: Image.asset(
//                                         'assets/images/png/TF.png',
//                                         height: 30,
//                                       ),
//                                     ),
//                                     Center(
//                                       child: Text(
//                                         'UAE',
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           bottomSheet: Container(
//             width: screenwidth,
//             height: 40,
//             child: RaisedButton(
//               onPressed: () {
//                 model.goToAddDetails(context,
//                     myPhone: _phone.text, uae: _name.text);
//               },
//               child: const Text('إنتقل الأن إلى بوابة الدفع',
//                   style: TextStyle(fontSize: 20)),
//               color: Color(0xFFD0DD28),
//               textColor: Colors.white,
//               elevation: 5,
//             ),
//           ),
//         );
//       },
//       viewModelBuilder: () => AddReciverViewModel(),
//     );
//   }
// }

class AddReciver extends StatefulWidget {
  @override
  _AddReciverState createState() => _AddReciverState();
}

class _AddReciverState extends State<AddReciver> {
  ContactPicker _contactPicker = ContactPicker();
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    obj.setBool("isSender", false);
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
//360
    double screenhigh = MediaQuery.of(context).size.height;

    double A;
    double B;
    double C;

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      A = screenwidth / 1.2;
      B = screenwidth / 1.44;
      C = screenwidth / 2.11;
    } else {
      A = screenwidth / 1.2;

      B = screenwidth / 1.44;
      C = screenwidth / 2.11;
    }

    return ViewModelBuilder.reactive(
        builder:
            (BuildContext context, AddReciverViewModel model, Widget child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: model.colorPattern.primaryColor,
              centerTitle: true,
              title: Container(
                child: SvgPicture.asset(
                  'assets/images/svg/ic_small_logo.svg',
                  height: 40,
                ),
              ),
              leadingWidth: 48,
              leading: Container(
                padding: EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/images/svg/ic_menu.svg',
                ),
              ),
            ),
            body: ListView(
              children: [
                ActionBar(
                  title: 'إرسال',
                  colorPattern: model.colorPattern,
                  back: () {
                    Navigator.of(context).pop();
                  },
                  help: () {},
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    PageLogo(
                      imagePath: 'assets/images/svg/ic_circle.svg',
                      height: 60,
                    ),
                    Text(
                      '1',
                      style: TextStyle(fontSize: 45, color: Color(0xFFD0DD28)),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    'إضافة مستلم',
                    style: TextStyle(
                        color: model.colorPattern.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Text('إسم جهة الإتصال'),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: A,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: A,
                                height: 30,
                                decoration: BoxDecoration(
                                  //borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(2, 0),
                                      color: Colors.grey,
                                      spreadRadius: 0,
                                      blurRadius: 2,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child: TextField(
                                  controller: _name,
                                  cursorColor: model.colorPattern.primaryColor,
                                  textAlign: TextAlign.center,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          Contact contact = await _contactPicker
                                              .selectContact();
                                          setState(() {
                                            _name.text = contact.fullName;
                                            _phone.text =
                                                contact.phoneNumber.number;
                                          });
                                          model.changeInitValue(
                                            contact.fullName,
                                            contact.phoneNumber.number,
                                          );
                                        },
                                        child: Image.asset(
                                          'assets/images/png/TF.png',
                                          height: 30,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          '+',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: A,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: A,
                                height: 30,
                                decoration: BoxDecoration(
                                  //borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(2, 0),
                                      color: Colors.grey,
                                      spreadRadius: 0,
                                      blurRadius: 2,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child: TextField(
                                  controller: _phone,
                                  cursorColor: model.colorPattern.primaryColor,
                                  textAlign: TextAlign.center,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/png/TF.png',
                                          height: 30,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'UAE',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
              ],
            ),
            bottomNavigationBar: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenwidth,
                      height: 47,
                      child: RaisedButton(
                        onPressed: () {
                          model.goToAddDetails(context,
                              myPhone: _phone.text, uae: _name.text);
                        },
                        child: const Text('إنتقل الأن إلى بوابة الدفع',
                            style: TextStyle(fontSize: 20)),
                        color: Color(0xFFD0DD28),
                        textColor: Colors.white,
                        elevation: 5,
                      ),
                    ),
                  ],
                )),
          );
        },
        viewModelBuilder: () => AddReciverViewModel());
  }
}
