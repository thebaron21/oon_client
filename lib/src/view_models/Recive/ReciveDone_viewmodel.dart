import 'package:flutter/material.dart';
import 'package:oon_client/src/view/Track/Track.dart';
import 'package:oon_client/src/view/reciver/AddReciver.dart';

import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

class ReciveDoneViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();

  goToRecive(BuildContext context) {
    _navigator(context, AddReciver());
  }

  goToSender(BuildContext context) {
    // _navigator(context, );
  }

  goToTrack(BuildContext context) {
    _navigator(context, Track());
  }

  _navigator(context, dynamic page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
