import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';
import 'package:oon_client/src/view_models/home_viewmodel.dart';
import '../remove/page_logo.dart';
import 'package:stacked/stacked.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ColorPattern colorPattern = ColorPattern();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, HomeViewModel model, Widget child) {
        double screenwidth = MediaQuery.of(context).size.width;

        double screenhigh = MediaQuery.of(context).size.height;
        double sendimageHight = screenwidth / 2.4;
        double sal_RecImageHight = screenwidth / 1.8;
        double trackImageHight = screenwidth / 7.2;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFFD0DD28),
            centerTitle: true,
            title: Container(
              child: SvgPicture.asset(
                'assets/images/svg/ic_small_logo.svg',
                height: 40,
              ),
            ),
            leadingWidth: 48,
            // leading: Container(
            //   padding: EdgeInsets.all(8),
            //   child: SvgPicture.asset(
            //     'assets/images/svg/ic_menu.svg',
            //   ),
            // ),
          ),
          body: new Theme(
            data: ThemeData(primaryColor: Color(0XFFD0DD28)),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      screenwidth - 100, screenhigh / 12, 0, 0),
                  child: Text(
                    '!مرحبا',
                    style: TextStyle(fontSize: 36, color: Color(0XFFD0DD28)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(screenwidth - 220, 10, 0, 0),
                  child: Text(
                    'الرجاء إختيار النشاط الذي تود القيام به',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, screenhigh / 15, 0, 0)),
                Row(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.fromLTRB(screenwidth / 10, 0, 0, 0)),
                    Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                model.goToSender(context);
                              },
                              child: Container(
                                width: screenwidth / 2.7,
                                height: screenwidth / 2.7,
                                child: CircleAvatar(
                                  backgroundColor: Color(0XFFD0DD28),
                                  child: PageLogo(
                                    imagePath: 'assets/images/svg/ic_send.svg',
                                    height: sendimageHight,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                        Row(
                          children: [
                            Text(
                              'إرسال',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black45,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(28, 0, 0, 0)),
                    Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                {
                                  model.goToBuy(context);
                                }
                              },
                              child: Container(
                                width: screenwidth / 2.7,
                                height: screenwidth / 2.7,
                                child: CircleAvatar(
                                  backgroundColor: Color(0XFFD0DD28),
                                  child: Container(
                                    width: 150,
                                    child: PageLogo(
                                      imagePath: 'assets/images/svg/sale.svg',
                                      height: sal_RecImageHight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                        Row(
                          children: [
                            Text(
                              'بيع',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black45,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0.0)),
                Row(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.fromLTRB(screenwidth / 10, 0, 0, 0)),
                    Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                model.goToTrack(context);
                              },
                              child: Container(
                                width: screenwidth / 2.7,
                                height: screenwidth / 2.7,
                                child: CircleAvatar(
                                  backgroundColor: Color(0XFFD0DD28),
                                  child: Image.asset(
                                    'assets/images/png/track.png',
                                    height: trackImageHight,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        ),
                        Row(
                          children: [
                            Text(
                              'تتبع',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black45,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(28, 0, 0, 0)),
                    Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                {
                                  model.goToRecive(context);
                                }
                              },
                              child: Container(
                                width: screenwidth / 2.7,
                                height: screenwidth / 2.7,
                                child: CircleAvatar(
                                  backgroundColor: Color(0XFFD0DD28),
                                  child: Container(
                                    width: 150,
                                    child: PageLogo(
                                      imagePath:
                                          'assets/images/svg/ic_receive.svg',
                                      height: sal_RecImageHight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                        Row(
                          children: [
                            Text(
                              'إستلام',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black45,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
