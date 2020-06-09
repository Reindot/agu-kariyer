import 'dart:ui';

import 'package:agucareer/models/file_model.dart';
import 'package:agucareer/models/notification_model.dart';
import 'package:agucareer/pages/arrange_meeting.dart';
import 'package:agucareer/pages/survey_pages/select_survey.dart';
import 'package:agucareer/pages/view_file_page.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  double FilesLength;
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.koyuMor.withOpacity(1),
      appBar: _getCustomAppBar(),
      body: FutureBuilder<List<Notifications>>(
        future: _userModel.getNotifications(_userModel.user),
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
                  switch (chat.type) {
                    case "ANN":
                      {
                        return GestureDetector(
                          onTap: () => {},
                          child: Container(
                            margin: EdgeInsets.only(bottom: 2),
                            padding: EdgeInsets.only(top: 22, bottom: 22),
                            decoration: BoxDecoration(
                              color: AppColors.pembe.withOpacity(1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(75)),
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
                                  backgroundImage:
                                      NetworkImage(chat.profileURL),
                                ),
                                SizedBox(width: screenSize.width / 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      chat.text,
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      break;

                    case "MEETING_CREATED":
                      {}
                      break;

                    case "CONFIRM_MEETING":
                      {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    _MeetingRequestDialog());
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 2),
                            padding: EdgeInsets.only(top: 22, bottom: 22),
                            decoration: BoxDecoration(
                              color: AppColors.pembe.withOpacity(1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(75)),
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
                                  backgroundImage:
                                      NetworkImage(chat.profileURL),
                                ),
                                SizedBox(width: screenSize.width / 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      chat.text,
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      break;

                    case "MONTHLY_REMINDER":
                      {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  ArrangeMeeting(),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 2),
                            padding: EdgeInsets.only(top: 22, bottom: 22),
                            decoration: BoxDecoration(
                              color: AppColors.pembe.withOpacity(1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(75)),
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
                                  backgroundImage:
                                      NetworkImage(chat.profileURL),
                                ),
                                SizedBox(width: screenSize.width / 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Bu Ay İçerisinde Yeni Bir Buluşma Ayarlamalısın.",
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      break;

                    case "DAILY_REMINDER":
                      {
                        return GestureDetector(
                          onTap: () => {},
                          child: Container(
                            margin: EdgeInsets.only(bottom: 2),
                            padding: EdgeInsets.only(top: 22, bottom: 22),
                            decoration: BoxDecoration(
                              color: AppColors.pembe.withOpacity(1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(75)),
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
                                  backgroundImage:
                                      NetworkImage(chat.profileURL),
                                ),
                                SizedBox(width: screenSize.width / 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Buluşmana 24 saat var.",
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      break;

                    case "LAST_NOTIFICATION":
                      {
                        return GestureDetector(
                          onTap: () => {},
                          child: Container(
                            margin: EdgeInsets.only(bottom: 2),
                            padding: EdgeInsets.only(top: 22, bottom: 22),
                            decoration: BoxDecoration(
                              color: AppColors.pembe.withOpacity(1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(75)),
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
                                  backgroundImage:
                                      NetworkImage(chat.profileURL),
                                ),
                                SizedBox(width: screenSize.width / 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Buluşmana 2 saat kaldı, hazırlanıp yola çıkmalısın.",
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      break;

                    case "MEETING_DONE":
                      {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _MeetingCheckDialog(),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 2),
                            padding: EdgeInsets.only(top: 22, bottom: 22),
                            decoration: BoxDecoration(
                              color: AppColors.pembe.withOpacity(1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(75)),
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
                                  backgroundImage:
                                      NetworkImage(chat.profileURL),
                                ),
                                SizedBox(width: screenSize.width / 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Buluşma Tarihin Geçti. Mentörünle buluştuğunu onaylıyor musun?",
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      break;

                    case "FILL_SURVEY":
                      {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  SelectSurvey(),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 2),
                            padding: EdgeInsets.only(top: 22, bottom: 22),
                            decoration: BoxDecoration(
                              color: AppColors.pembe.withOpacity(1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(75)),
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
                                  backgroundImage:
                                  NetworkImage(chat.profileURL),
                                ),
                                SizedBox(width: screenSize.width / 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Ahmet Soran ile yaptığın görüşmenin geri bildirim anketini doldurmalısın",
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      break;
                  }
                  return null;
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
                      color: AppColors.acikMavi.withOpacity(1),
                    ),
                    onPressed: () => Navigator.pop(context)),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "BİLDİRİMLER",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.acikMavi.withOpacity(1),
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _MeetingRequestDialog() {
    return AlertDialog(
      backgroundColor: AppColors.koyuMor.withOpacity(1.0),
      title: Text(
        "1 Kişi Seninle Buluşma Ayarladı",
        style: TextStyle(
            color: AppColors.acikMavi.withOpacity(1.0),
            fontWeight: FontWeight.bold),
      ),
      content: Card(
        elevation: 0,
        color: AppColors.koyuMor,
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(""),
          ),
          title: Text("Enes Kaçan",
              style: TextStyle(
                  color: AppColors.acikMavi.withOpacity(1.0),
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          subtitle: Text(
            "15 Haziran 2020, Saat 16.00",
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(60), bottomLeft: Radius.circular(60))),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppColors.acikMor.withOpacity(1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          textColor: Colors.white,
          child: Text('Hayır'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppColors.pembe.withOpacity(1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          textColor: Colors.white,
          child: Text('Evet'),
        ),
      ],
    );
  }

  Widget _MeetingCheckDialog() {
    return AlertDialog(
      backgroundColor: AppColors.koyuMor.withOpacity(1.0),
      title: Text(
        "Onaylıyor musun?",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      content: Text(
        "Az önce bir buluşma ayarladın.\nOnaylıyor musun?",
        style: TextStyle(
          color: Colors.grey.shade700,
          fontFamily: 'OpenSans',
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(60), bottomLeft: Radius.circular(60))),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppColors.acikMor.withOpacity(1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          textColor: Colors.white,
          child: Text('Hayır'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppColors.pembe.withOpacity(1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          textColor: Colors.white,
          child: Text('Evet'),
        ),
      ],
    );
  }
}
