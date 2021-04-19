import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/user_model.dart';
import 'package:flutter_provider/serices/http_services.dart';


class ProviderHome extends ChangeNotifier {
  bool isLoading = false;
  String result;
  List<UserModels> userModels = [];

  BuildContext context;

  ProviderHome({BuildContext context}) {
    context = this.context;
  }



  Future getData() async {
    isLoading = true;
    notifyListeners();
    var userModel = await HttpServices.getData1(urls1: HttpServices.url1);
    userModels = userModel;
    isLoading = false;
    notifyListeners();
  }

  Future deleteItem(int id) async {
    isLoading = true;
    notifyListeners();
    result = await HttpServices.changeData1(changeItem: id.toString());
    notifyListeners();
    if (result == "1") {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     duration: Duration(milliseconds: 350),
      //     content: Text("Deleted :)"),
      //   ),
      // );

      getData();
      isLoading = false;
      notifyListeners();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   duration: Duration(milliseconds: 350),
      //   content: Text("Not deleted :("),
      // ));
      getData();
      isLoading = false;
      notifyListeners();
    }

  }

}