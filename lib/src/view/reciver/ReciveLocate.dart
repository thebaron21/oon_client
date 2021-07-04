import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view_models/recive/ReciveLocate_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ReciveLocate extends StatefulWidget {
  @override
  _ReciveLocateState createState() => _ReciveLocateState();
}

class _ReciveLocateState extends State<ReciveLocate> {
  @override
  Widget build(BuildContext context) {
    // double screenwidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder.reactive(
      builder:
          (BuildContext context, ReciveLocateViewModel model, Widget child) {
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
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ActionBar(
                  title: 'إرسال',
                  colorPattern: model.colorPattern,
                  back: () {
                    Navigator.of(context).pop();
                  },
                  help: () {},
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    child: GoogleMap(
                      markers: model.mapsMarker.toSet(),
                      onTap: (value) {
                        model.selectPosition(value);
                      },
                      myLocationEnabled: true,
                      mapType: MapType.normal,
                      initialCameraPosition: model.cameraPosition,
                      onMapCreated: (con) {
                        model.changeCompleter(con);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
          bottomSheet: Container(
            height: 50,
            width: size.width,
            child: RaisedButton(
              onPressed: () {
                model.nextPage(context);
              },
              child: const Text('تحديد الموقع', style: TextStyle(fontSize: 20)),
              color: Color(0xFFD0DD28),
              textColor: Colors.white,
              elevation: 5,
            ),
          ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.miniStartFloat,
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: model.colorPattern.primaryColor,
          //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //   child: Icon(Icons.arrow_forward_ios),
          //   onPressed: () =>
          // ),
        );
      },
      viewModelBuilder: () => ReciveLocateViewModel(),
    );
  }
}
