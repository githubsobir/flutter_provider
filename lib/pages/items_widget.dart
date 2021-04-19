import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/user_model.dart';
import 'package:flutter_provider/pages/page_create/page2.dart';
import 'package:flutter_provider/pages/provider_home.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget items({BuildContext contexts, ProviderHome providerHome, UserModels userModel}) {

  return Slidable(
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userModel.title.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black),
          ),
          SizedBox(height: 5),
          Text(
            userModel.body,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    ),
    actionPane: SlidableDrawerActionPane(),
    actions: <Widget>[
      IconSlideAction(
        caption: "Update",
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: () {
          String user = jsonEncode(userModel);
          Navigator.push(
              contexts,
              MaterialPageRoute(
                builder: (context) => Page2(
                  textTitle: "update",
                  data: user,
                  update: "1",
                ),
              ));
        },
      )
    ],
    secondaryActions: [
      IconSlideAction(
        caption: "Delete",
        color: Colors.red,
        icon: CupertinoIcons.trash,
        onTap: () {
          providerHome.deleteItem(userModel.id);
        },
      )
    ],
  );
}