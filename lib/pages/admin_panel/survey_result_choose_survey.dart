import 'package:agucareer/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurveyResultsChooseSurvey extends StatefulWidget {
  @override
  _SurveyResultsChooseSurvey createState() => _SurveyResultsChooseSurvey();
}

class _SurveyResultsChooseSurvey extends State<SurveyResultsChooseSurvey> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.koyuMor.withOpacity(1),
        appBar: _getCustomAppBar(),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Text("Anket Seç",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans')),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Card(
                      margin: EdgeInsets.only(
                          top: 10, bottom: 10, right: 15, left: 15),
                      color: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          title: Text(
                            "1. Görüşme Anketi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            debugPrint("ankete basildi");
                          },
                        ),
                      )),
                  Card(
                      margin: EdgeInsets.only(
                          top: 10, bottom: 10, right: 15, left: 15),
                      color: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          debugPrint("ankete basildi");
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: ListTile(
                            title: Text(
                              "2. Görüşme Anketi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              debugPrint("ankete basildi");
                            },
                          ),
                        ),
                      )),
                  Card(
                      margin: EdgeInsets.only(
                          top: 10, bottom: 10, right: 15, left: 15),
                      color: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          debugPrint("ankete basildi");
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: ListTile(
                            title: Text(
                              "3. Görüşme Anketi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              debugPrint("ankete basildi");
                            },
                          ),
                        ),
                      )),
                  Card(
                      margin: EdgeInsets.only(
                          top: 10, bottom: 10, right: 15, left: 15),
                      color: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          debugPrint("ankete basildi");
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: ListTile(
                            title: Text(
                              "4. Görüşme Anketi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              debugPrint("ankete basildi");
                            },
                          ),
                        ),
                      )),
                  Card(
                      margin: EdgeInsets.only(
                          top: 10, bottom: 10, right: 15, left: 15),
                      color: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          debugPrint("ankete basildi");
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: ListTile(
                            title: Text(
                              "5. Görüşme Anketi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              debugPrint("ankete basildi");
                            },
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ));
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
          color: Colors.white,
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
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "Anketleri Gör",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
