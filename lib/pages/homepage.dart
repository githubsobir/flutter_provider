import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/user_model.dart';
import 'package:flutter_provider/pages/items_widget.dart';
import 'package:flutter_provider/pages/page_create/page2.dart';
import 'package:flutter_provider/pages/provider_home.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String updated;

  final String created;

  static final  String id = "homepage";

  HomePage({this.created, this.updated});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProviderHome providerHome = ProviderHome();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    providerHome.getData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => providerHome,
        child: Consumer<ProviderHome>(
          builder: (context, value, child) => Stack(
            children: [
              ListView.builder(
                itemCount: providerHome.userModels.length,
                itemBuilder: (context, index) =>
                    items(contexts: context, providerHome: providerHome, userModel: providerHome.userModels[index]),
              ),
              providerHome.isLoading
                  ? Center(child: CupertinoActivityIndicator())
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Page2(
                  textTitle: "Create",
                  update: "0",
                ),
              ));
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }


}
