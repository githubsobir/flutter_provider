import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/user_model.dart';

import 'package:flutter_provider/pages/page_create/provider_create.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  final String data;
  final String textTitle;
  final String update;
  static final String id = "page2";

  Page2({this.data, this.textTitle, this.update});

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  ProviderCreate providerCreate = ProviderCreate();

  @override
  Widget build(BuildContext context) {

    TextEditingController textTitles = new TextEditingController();
    TextEditingController textBody = new TextEditingController();

    try {
      providerCreate.userModels = UserModels.fromJson(jsonDecode(widget.data));
      textTitles.text = providerCreate.userModels.title.toUpperCase().isEmpty
          ? " "
          : providerCreate.userModels.title.toUpperCase();
      textBody.text = providerCreate.userModels.body.isEmpty
          ? " "
          : providerCreate.userModels.body;
    } catch (e) {}

    int randomNum = providerCreate.random.nextInt(1000);

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.textTitle.isEmpty ? " " : widget.textTitle}"
            .toUpperCase()),
      ),
      body: ChangeNotifierProvider(
          create: (context) => providerCreate,
          child: Consumer<ProviderCreate>(
              builder: (context, value, child) => SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(10),
                          child: TextField(
                            controller: textTitles,
                            textAlign: TextAlign.center,
                            // style: TextStyle(
                            //     color: Colors.black, fontWeight: FontWeight.bold),
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Title',
                              hintText: 'Title',
                            ),
                            autofocus: false,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(10),
                          child: TextField(
                            textAlign: TextAlign.left,
                            controller: textBody,
                            maxLines: 10,
                            decoration: InputDecoration(
                              labelText: "Body",
                              hintText: "body",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (widget.update == "1") {
                              Map<String, dynamic> maps = {
                                "userId": providerCreate.userModels.userId,
                                "id": providerCreate.userModels.id,
                                "body": textBody.text.toString(),
                                "title": textTitles.text.toString(),
                              };
                              providerCreate.update(context, maps);
                            }

                            if (widget.update == "0") {
                              Map<String, dynamic> maps = {
                                "userId": randomNum,
                                "body": textBody.text.toString(),
                                "title": textTitles.text.toString(),
                              };
                              if (textBody.text.isNotEmpty &&
                                  textTitles.text.isNotEmpty)
                                providerCreate.create(context, maps);
                              else
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("TextField empty")));
                            }
                          },
                          child: Text(
                            "press for ${widget.textTitle} ".toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                          height: 45,
                          minWidth: 200,
                        ),
                      ],
                    ),
                  ))),
    );
  }
}
