
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/user_model.dart';
import 'package:flutter_provider/pages/homepage.dart';
import 'package:flutter_provider/serices/http_services.dart';

class ProviderCreate extends ChangeNotifier {
  UserModels userModels;
  BuildContext context;
  Random random = Random();

  Future update(BuildContext ctx,Map<String, dynamic> maps) async {
    String s = await HttpServices.upData(
      id: userModels.id.toString(),
      params: maps,
    );
    notifyListeners();
    Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(
          builder: (ctx) => HomePage(),
        ));
  }

  Future create(BuildContext ctx, Map<String, dynamic> maps) async {
    String creat = await HttpServices.createData(params: maps);
    notifyListeners();
    Navigator.pop(ctx);
    notifyListeners();
  }
}
