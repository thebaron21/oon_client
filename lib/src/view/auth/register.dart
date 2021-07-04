import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'verification_view.dart';

class RegisterPage extends StatefulWidget {
  String location;
  RegisterPage({this.location});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static const IconData maps_home_work_outlined =
      IconData(61871, fontFamily: 'MaterialIcons');
  TextEditingController _username = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _addressLocation = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String apiKey = 'AIzaSyD9ckDkX8LPJezARCxA1k9wuigJ_VaLLMY';
  @override
  void initState() {
    super.initState();
    if (widget.location != null) {
      _addressLocation.text = widget.location;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenhigh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0XFFD0DD28),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/svg/background.svg',
            fit: BoxFit.fill,
          ),
          ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0, (screenhigh / 9), 0, 0)),
              SvgPicture.asset(
                'assets/images/svg/ic_small_logo.svg',
                height: 80,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, (screenhigh / 7), 0, 0)),
              Center(
                child: Text(
                  'لطفا قم بإنشاء حساب',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: screenwidth / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenwidth / 1.8,
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
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: TextField(
                                controller: _username,
                                cursorColor: Color(0XFF808285),
                                textAlign: TextAlign.center,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "الإسم الكامل",
                                  hintStyle: new TextStyle(
                                    color: Color(0XFF808285),
                                  ),
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
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: 10,
                                                  color: Color(0XFFD0DD28),
                                                  height: 40,
                                                )
                                              ],
                                            ),
                                            Image.asset(
                                              'assets/images/png/TF.png',
                                              color: Color(0XFF808285),
                                              height: 40,
                                            ),
                                          ],
                                        )),
                                    Center(
                                        child: Icon(
                                      Icons.person,
                                      color: Color(0XFFD0DD28),
                                    ))
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: screenwidth / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenwidth / 1.8,
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
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: TextField(
                                cursorColor: Color(0XFF808285),
                                textAlign: TextAlign.center,
                                controller: _address,
                                decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "أدخال العنوان يدويا",
                                    hintStyle: new TextStyle(
                                      color: Color(0XFF808285),
                                    )),
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
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: 10,
                                                  color: Color(0XFFD0DD28),
                                                  height: 40,
                                                )
                                              ],
                                            ),
                                            Image.asset(
                                              'assets/images/png/TF.png',
                                              color: Color(0XFF808285),
                                              height: 40,
                                            ),
                                          ],
                                        )),
                                    Center(
                                        child: Icon(
                                      maps_home_work_outlined,
                                      color: Color(0XFFD0DD28),
                                    ))
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
              Center(
                  child: Text(
                'أو',
                style: TextStyle(color: Colors.white, fontSize: 24),
              )),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: screenwidth / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenwidth / 1.8,
                              padding: EdgeInsets.only(right: 4, left: 12),
                              decoration: BoxDecoration(
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
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                              child: TextField(
                                controller: _addressLocation,
                                cursorColor: Color(0XFF808285),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "تحديد الموقع أتوماتيكيا",
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color(0XFF808285),
                                  ),
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
                                        onTap: () {
                                          print("Click Open Maps");
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => OpenMap(),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: 10,
                                                  color: Color(0XFFD0DD28),
                                                  height: 40,
                                                )
                                              ],
                                            ),
                                            Image.asset(
                                              'assets/images/png/TF.png',
                                              color: Color(0XFF808285),
                                              height: 40,
                                            ),
                                          ],
                                        )),
                                    Center(
                                        child: Icon(
                                      Icons.location_pin,
                                      color: Color(0XFFD0DD28),
                                    ))
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
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              Center(
                child: Container(
                  width: screenwidth / 1.5,
                  child: ButtonTheme(
                      height: 40,
                      buttonColor: Color(0XFF808285),
                      child: RaisedButton(
                          onPressed: () {
                            openCodePage(
                              username: _username.text,
                              address: widget.location != null
                                  ? widget.location
                                  : _address.text,
                            );
                          },
                          child: Text(
                            'أنشيء حساب',
                            style: new TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40),
                          ))),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, screenhigh / 40, 0, 0),
                    ),
                    Text(
                      'بالضغط على زر تنشيط فأنت توافق على ',
                      style: new TextStyle(color: Colors.white70),
                    ),
                    Text(
                      'شروط التطبيق',
                      style: new TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  openCodePage({String username, String address}) async {
    SharedPreferences obj = await SharedPreferences.getInstance();

    String opt = obj.getString("opt");

    print(opt);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationView(
          username: username,
          address: address,
          opt: opt,
        ),
      ),
    );
  }

  showMessage({BuildContext context, String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message"),
    ));
  }
}

class OpenMap extends StatefulWidget {
  static CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(12.0055, -12.32389), zoom: 18.009);

  @override
  _OpenMapState createState() => _OpenMapState();
}

class _OpenMapState extends State<OpenMap> {
  String apiKey = 'AIzaSyD9ckDkX8LPJezARCxA1k9wuigJ_VaLLMY';
  // Location _location;
  Completer<GoogleMapController> completer = Completer();
  List<Marker> mapsMarker = List<Marker>();
  String address;

  @override
  void initState() {
    super.initState();
    // _location = Location();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            width: size.width,
            height: size.height * 0.8,
            child: GoogleMap(
              myLocationEnabled: true,
              markers: mapsMarker.toSet(),
              onTap: (value) {
                selectLocation(value);
              },
              mapType: MapType.normal,
              initialCameraPosition: OpenMap._cameraPosition,
              onMapCreated: (con) {
                completer.complete(con);
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFD0DD28),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          closeMaps(address, context);
        },
      ),
    );
  }

  selectLocation(LatLng value) async {
    setState(() {
      mapsMarker.add(
        Marker(
          position: value,
          markerId: MarkerId("1"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        ),
      );
    });

    List<Placemark> placemarks =
        await placemarkFromCoordinates(value.latitude, value.longitude);
    print(placemarks.first);
    setState(() {
      address =
          "${placemarks.first.country} ${placemarks.first.administrativeArea} ${placemarks.first.subAdministrativeArea} ${placemarks.first.subLocality} ${placemarks.first.street}";
    });
    print("$address");
  }

  void closeMaps(String location, context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return RegisterPage(
            location: location,
          );
        },
      ),
    );
  }
}// _addressLocation =
      //     "${placemarks.first.country},${placemarks.first.administrativeArea},${placemarks.first.subAdministrativeArea},${placemarks.first.subLocality},${placemarks.first.street}";