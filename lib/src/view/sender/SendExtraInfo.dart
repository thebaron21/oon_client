import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view_models/sender/SendExtraInfo_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'SendPay.dart';

class SendExtraInfo extends StatefulWidget {
  final String address;
  const SendExtraInfo({this.address, Key key}) : super(key: key);
  @override
  _SendExtraInfoState createState() => _SendExtraInfoState();
}

class _SendExtraInfoState extends State<SendExtraInfo> {
  // TextEditingController _fullDesc = TextEditingController();
  String _fullDesc;
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  String address;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    address = obj.getString("address");
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
//360
    double screenhigh = MediaQuery.of(context).size.height;
    double A;
    double B;
    double C;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      A = screenwidth / 1.44;
      B = screenhigh / 25.33;
      C = screenwidth / 2.04;
    } else {
      A = screenwidth / 1.44;
      B = screenhigh / 12;

      C = screenwidth / 2.04;
    }

    return ViewModelBuilder.reactive(
      builder:
          (BuildContext context, SendExtraInfoViewModel model, Widget child) {
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
          body: Form(
            key: _keyForm,
            child: ListView(
              children: [
                ActionBar(
                  title: 'إرسال',
                  colorPattern: model.colorPattern,
                  back: () {},
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
                      "3",
                      style: TextStyle(
                        fontSize: 35,
                        color: model.colorPattern.primaryColor,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 225, 0, 0),
                ),
                Container(
                    width: 200,
                    height: 280,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    decoration: BoxDecoration(
                        color: Color(0xFFF1F2F2),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        ),
                        Text(
                          'هل ترغب بإضافة تفاصيل إضافية للعنوان؟',
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        ),
                        Container(
                          height: B,
                          width: A,
                          child: TextFormField(
                            cursorColor: Color(0XFFD0DD28),
                            textAlign: TextAlign.center,
                            onSaved: (value) => _fullDesc = value,
                            decoration: new InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0),
                                  ),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0XFFD0DD28),
                                  ),
                                ),
                                hintText: "",
                                hintStyle: new TextStyle(
                                  color: Color(0XFFD0DD28),
                                )),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                RaisedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'إلغاء',
                                    style: new TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(40),
                                  ),
                                  color: Color(0xFFD0DD28),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                            ),
                            Column(
                              children: [
                                RaisedButton(
                                  onPressed: () async {
                                    final _form = _keyForm.currentState;
                                    if (_form.validate()) {
                                      _form.save();
                                    }
                                    print("Full Description " + _fullDesc);
                                    SharedPreferences obj =
                                        await SharedPreferences.getInstance();
                                  },
                                  child: Text(
                                    'إضافة',
                                    style: new TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(40),
                                  ),
                                  color: Color(0xFFD0DD28),
                                ),
                              ],
                            )
                          ],
                        ),
                        Divider(
                          indent: 20,
                          thickness: 1,
                          endIndent: 20,
                          height: 10,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Text(widget.address.substring(0, 25),
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),), //'الرياض,العليا,حديقةالعليا'
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 50, 0),
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    child:
                                        Image.asset('assets/images/png/g1.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(3)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Text('160,20'),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 50, 0),
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    child:
                                        Image.asset('assets/images/png/g.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: C,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('الرجوع',
                                  style: TextStyle(fontSize: 20)),
                              color: Color(0xFF6D6F72),
                              textColor: Colors.white,
                              elevation: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: C,
                            child: RaisedButton(
                              onPressed: () async {
                                SharedPreferences obj =
                                    await SharedPreferences.getInstance();
                                if (_fullDesc == null) {
                                  setState(() => _fullDesc = "");
                                  obj.setString("full_desc", _fullDesc);
                                } else {
                                  obj.setString("full_desc", _fullDesc);
                                  model.gotToTime(context, widget.address);
                                }

                                print("$_fullDesc");
                              },
                              child: Text(
                                ' تأكيد العنوان',
                                style: TextStyle(fontSize: 20),
                              ),
                              color: Color(0xFFD0DD28),
                              textColor: Colors.white,
                              elevation: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => SendExtraInfoViewModel(),
    );
  }
}
