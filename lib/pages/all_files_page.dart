import 'dart:ui';

import 'package:agucareer/models/file_model.dart';
import 'package:agucareer/pages/view_file_page.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AllFilesPage extends StatefulWidget {
  @override
  _AllFilesPageState createState() => _AllFilesPageState();
}

class _AllFilesPageState extends State<AllFilesPage> {
  double FilesLength;
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.koyuMor.withOpacity(1),
      appBar: _getCustomAppBar(),
      body: FutureBuilder<List<Files>>(
        future: _userModel.getFileList(),
        builder: (context, chatList) {
          if (!chatList.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var allFiles = chatList.data;
            return Stack(children: [
              Container(
                height: 136,
                color: AppColors.pembe.withOpacity(1),
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 107,
                    color: AppColors.pembe.withOpacity(1),
                  );
                },
                itemCount: allFiles.length - 1,
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  var chat = allFiles[index];
                  return GestureDetector(
                    onTap: () => viewPDF(chat.url),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 2),
                      padding: EdgeInsets.only(top: 22, bottom: 22),
                      decoration: BoxDecoration(
                        color: AppColors.pembe.withOpacity(1),
                        borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(75)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: screenSize.width / 12),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(chat.profileURL),
                          ),
                          SizedBox(width: screenSize.width / 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                chat.name,
                                style: TextStyle(
                                    color: Colors.grey.shade400, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: allFiles.length,
              ),
            ]);
          }
        },
      ),
    );
  }

  String _showTimeStamp(Timestamp date) {
    var _formatter = DateFormat.Hm();
    return _formatter.format(date.toDate());
  }

  _getCustomAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
          ),
          color: AppColors.koyuMor.withOpacity(1.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    padding: EdgeInsets.all(20),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context)),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "DOSYALAR",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  viewPDF(String url) async{
    PDFDocument doc = await PDFDocument.fromURL(url);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ViewFilePage(doc: doc,)));
  }
}
