import 'package:flutter/material.dart';
import 'package:oon_client/src/view/Track/Track.dart';
import 'package:oon_client/src/view/reciver/AddReciver.dart';
import 'package:oon_client/src/view/sender/SendSelectLocal.dart';
import '../helpers/color_pattern.dart';
import '../helpers/config.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();
  Config config = Config();

  goToBuy(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "قريبا",
            textAlign: TextAlign.end,
          ),
          content: Text(
            "قريبا سوف يتم إضافة هذا القسم",
            textAlign: TextAlign.end,
          ),
          actions: [
            FlatButton(
              child: Text("موفق"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  goToRecive(BuildContext context) {
    _navigator(context, AddReciver());
  }

  goToSender(BuildContext context) {
    _navigator(context, SelectLocation());
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
