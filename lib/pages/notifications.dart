import 'package:agucareer/values/colors.dart';
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
              "MESAJLAR",
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
