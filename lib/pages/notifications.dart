import 'package:agucareer/pages/arrange_meeting.dart';
import 'package:agucareer/pages/survey_pages/select_survey.dart';
import 'package:agucareer/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget{
  @override
  _NotificationPageState createState() => _NotificationPageState();
  }
class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _getCustomAppBar(),
      backgroundColor: AppColors.koyuMor.withOpacity(1),
      body: Stack(
        children: <Widget>[
          Container(
            height: 124,
            color: AppColors.koyuMor.withOpacity(1) ,
          ),
          ListView(
            children: <Widget>[
              _FillSurveyNotification(),
              _CheckMeetingNotification(),
              _24HoursNotification(),
              _2HoursNotification(),
              _NewMeetingNotification(),
              _MeetingRequestNotification()
            ],
          )
        ],


      ),


    );
  }

  Widget _FillSurveyNotification(){
    return Container(
      child: GestureDetector(
        onTap: (){
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
            color:  AppColors.acikMavi.withOpacity(1) ,
            borderRadius:
            BorderRadius.only(bottomLeft: Radius.circular(75)),
          ),
          child: Card(
            elevation: 0,
            color: AppColors.acikMavi,
            child: ListTile(
              leading:CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(""),
              ),
              title: Text("Ahmet Soran ile yaptığın görüşmenin geri bildirim anketini doldurmalısın",
              style: TextStyle(color: Colors.white) ),
            ),
          )
        ),
      ),
    );
  }
  Widget _CheckMeetingNotification(){
    return Container(
      child: GestureDetector(
        onTap: (){
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
              color:  AppColors.acikMor.withOpacity(1) ,
              borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(75)),
            ),
            child: Card(
              elevation: 0,
              color: AppColors.acikMor,
              child: ListTile(
                leading:CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(""),
                ),
                title: Text("Buluşma Tarihin Geçti. Mentörünle buluştuğunu onaylıyor musun?",
                    style: TextStyle(color: Colors.white) ),
              ),
            )
        ),
      ),
    );
  }
  Widget _24HoursNotification(){
    return Container(
      child: GestureDetector(
        onTap: (){},
        child: Container(
            margin: EdgeInsets.only(bottom: 2),
            padding: EdgeInsets.only(top: 22, bottom: 22),
            decoration: BoxDecoration(
              color:  AppColors.acikMavi.withOpacity(1) ,
              borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(75)),
            ),
            child: Card(
              elevation: 0,
              color: AppColors.acikMavi,
              child: ListTile(
                leading:CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(""),
                ),
                title: Text("Bir sonraki buluşmana 24 Saat var!",
                    style: TextStyle(color: Colors.white) ),
              ),
            )
        ),
      ),
    );
  }
  Widget _2HoursNotification(){
    return Container(
      child: GestureDetector(
        onTap: (){},
        child: Container(
            margin: EdgeInsets.only(bottom: 2),
            padding: EdgeInsets.only(top: 22, bottom: 22),
            decoration: BoxDecoration(
              color:  AppColors.acikMor.withOpacity(1) ,
              borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(75)),
            ),
            child: Card(
              elevation: 0,
              color: AppColors.acikMor,
              child: ListTile(
                leading:CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(""),
                ),
                title: Text("Bir sonraki buluşmana 2 Saat Kaldı. Hazırlanıp yola çıkmalısın",
                    style: TextStyle(color: Colors.white) ),
              ),
            )
        ),
      ),
    );
  }
  Widget _NewMeetingNotification(){
    return Container(
      child: GestureDetector(
        onTap: (){
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
              color:  AppColors.acikMavi.withOpacity(1) ,
              borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(75)),
            ),
            child: Card(
              elevation: 0,
              color: AppColors.acikMavi,
              child: ListTile(
                leading:CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(""),
                ),
                title: Text("Bu Ay İçerisinde Yeni Bir Buluşma Ayarlamalısın",
                    style: TextStyle(color: Colors.white) ),
              ),
            )
        ),
      ),
    );
  }
  Widget _MeetingRequestNotification(){
    return Container(
      child: GestureDetector(
        onTap: (){
          showDialog(
              context: context,
              builder: (BuildContext context) =>
              _MeetingRequestDialog());
        },
        child: Container(
            margin: EdgeInsets.only(bottom: 2),
            padding: EdgeInsets.only(top: 22, bottom: 22),
            decoration: BoxDecoration(
              color:  AppColors.acikMor.withOpacity(1) ,
              borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(75)),
            ),
            child: Card(
              elevation: 0,
              color: AppColors.acikMor,
              child: ListTile(
                leading:CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(""),
                ),
                title: Text("Enes Kaçan Seninle Bir Buluşma Talebinde Bulundu.",
                    style: TextStyle(color: Colors.white) ),
              ),
            )
        ),
      ),
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
              topRight: Radius.circular(60),
              bottomLeft: Radius.circular(60)
          )),
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
  Widget _MeetingRequestDialog() {
    return AlertDialog(
      backgroundColor: AppColors.koyuMor.withOpacity(1.0),
      title: Text(
        "1 Kişi Seninle Buluşma Ayarladı",
        style: TextStyle(color: AppColors.acikMavi.withOpacity(1.0), fontWeight: FontWeight.bold),
      ),
      content:Card(
        elevation: 0,
        color: AppColors.koyuMor,
        child: ListTile(
          leading:CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(""),
          ),
          title: Text("Enes Kaçan",
              style: TextStyle(color: AppColors.acikMavi.withOpacity(1.0),fontSize: 18,fontWeight: FontWeight.bold) ),
          subtitle: Text("15 Haziran 2020, Saat 16.00",style: TextStyle(color: Colors.grey.shade700),),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(60),
              bottomLeft: Radius.circular(60)
          )),
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
              "BİLDİRİMLER",
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
}
