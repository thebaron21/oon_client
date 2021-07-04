import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view_models/recive/ReciveTime_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ReciveTime extends StatefulWidget {
  String address;

  ReciveTime({Key key, @required this.address}) : super(key: key);
  @override
  _ReciveTimeState createState() => _ReciveTimeState();
}

class _ReciveTimeState extends State<ReciveTime> {
  String _dateSend = DateTime.utc(2000, 30, 2).toString();
  @override
  void initState() {
    super.initState();
    if (widget.address == null) {
      widget.address = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenwidth = MediaQuery.of(context).size.width;
    double screenhigh = MediaQuery.of(context).size.height;

    double C;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      C = screenwidth / 2.04;
    } else {
      C = screenwidth / 2.04;
    }
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, ReciveTimeViewModel model, Widget child) {
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
                    '3',
                    style: TextStyle(fontSize: 45, color: Color(0xFFD0DD28)),
                  )
                ],
              ),
              Center(
                child: Text(
                  'مواعيد الإرسال',
                  style: TextStyle(
                      color: model.colorPattern.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              Container(
                color: Color(0xFFF1F2F2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(widget.address //'الرياض,العليا,حديقةالعليا',
                            ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            maxRadius: 10,
                            child: Image.asset(
                              'assets/images/png/g.png',
                              width: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/png/Group2.png',
                height: 200,
              ),
              _buildTimeAndDate(context, size),
            ],
          ),
          bottomSheet: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: C,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'الرجوع',
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Color(0xFF6D6F72),
                  textColor: Colors.white,
                  elevation: 5,
                ),
              ),
              Container(
                width: C,
                child: RaisedButton(
                  onPressed: () async {
                    model.goToSelectLocation(context,
                        _dateSend == null ? DateTime.now() : _dateSend);
                  },
                  child: const Text('تأكيد', style: TextStyle(fontSize: 20)),
                  color: Color(0xFFD0DD28),
                  textColor: Colors.white,
                  elevation: 5,
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => ReciveTimeViewModel(),
    );
  }

  _buildTimeAndDate(BuildContext context, Size size) {
    return CalendarDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      initialCalendarMode: DatePickerMode.year,
      onDateChanged: (value) {
        setState(() => _dateSend = "${value.year}/${value.month}/${value.day}");
        print(_dateSend);
      },
    );
  }
}
