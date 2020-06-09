import 'dart:async';
import 'dart:ui';
import 'package:agucareer/models/meeting_model.dart';
import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ArrangeMeeting extends StatefulWidget {
  int fix = 1;
  @override
  _ArrangeMeetingState createState() => _ArrangeMeetingState();
}

class _ArrangeMeetingState extends State<ArrangeMeeting> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedPart = 0;
  String _selectedName = "Kişi Seçiniz";
  String _selectedPlace;
  DateTime _selectedDate;
  DateTime newDateTime = DateTime.now();
  var _selectedDateFormat;
  Duration _selectedTime;
  Duration _currentTime = Duration.zero;
  var _selectedTimeFormat;
  List<User> filteredUsers = List();
  final _debouncer = Debouncer(milliseconds: 500);
  final _titleAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final UserModel _userModel = Provider.of<UserModel>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget().drawerMenu(context, _userModel),
      backgroundColor: AppColors.pembe.withOpacity(1),
      appBar: _getCustomAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(right: 30, left: 30, top: 20),
              child: Column(
                children: <Widget>[
                  Spacer(flex: 1),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: screenSize.width / 2.5,
                          child: RaisedButton(
                            color: AppColors.acikMor.withOpacity(1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.lerp(Radius.circular(-45),
                                    Radius.circular(45), 1),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedPart = 0;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Spacer(flex: 1),
                                Icon(Icons.person, color: Colors.white),
                                Spacer(flex: 2),
                                Text(
                                  _selectedName,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(flex: 1),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: screenSize.width / 2.5,
                          child: RaisedButton(
                            color: AppColors.acikMor.withOpacity(1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.lerp(
                                      Radius.circular(-45), Radius.circular(45), 1),
                                )),
                            onPressed: () {
                              setState(() {
                                _selectedPart = 1;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Spacer(flex: 1),
                                Text(
                                  _selectedPlace == null
                                      ? 'Mekan Seçiniz'
                                      : _selectedPlace,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(flex: 2),
                                Icon(Icons.location_on, color: Colors.white),
                                Spacer(flex: 1),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          width: screenSize.width / 2.5,
                          child: RaisedButton(
                            color: AppColors.acikMor.withOpacity(1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.lerp(
                                      Radius.circular(-45), Radius.circular(45), 1),
                                )),
                            onPressed: () {
                              setState(() {
                                if (_selectedPart != 2) {
                                  newDateTime = DateTime.now();
                                }
                                _selectedPart = 2;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Spacer(flex: 1),
                                Icon(Icons.date_range, color: Colors.white),
                                Spacer(flex: 2),
                                Text(
                                  _selectedDate == null
                                      ? 'Tarih Seçiniz'
                                      : _selectedDateFormat.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(flex: 1),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: screenSize.width / 2.5,
                          child: RaisedButton(
                            color: AppColors.acikMor.withOpacity(1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.lerp(
                                      Radius.circular(-45), Radius.circular(45), 1),
                                )),
                            onPressed: () {
                              setState(() {
                                if (_selectedPart != 3) {
                                  _currentTime = Duration.zero;
                                }
                                _selectedPart = 3;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Spacer(flex: 1),
                                Text(
                                  _selectedTime == null
                                      ? 'Saat Seçiniz'
                                      : _selectedTimeFormat,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(flex: 2),
                                Icon(Icons.access_time, color: Colors.white),
                                Spacer(flex: 1),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: screenSize.width / 2,
                      child: RaisedButton(
                        color: AppColors.acikMor.withOpacity(1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(40))),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildDialogSetMeeting(context),
                          );
                        },
                        child: Text("AYARLA",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Builder(
              builder: (context) {
                if (_selectedPart == 0) {
                  return _buildPersonPart(context, _userModel);
                } else if (_selectedPart == 1) {
                  return _buildPlacePart(context);
                } else if (_selectedPart == 2) {
                  return _buildDatePart(context);
                } else {
                  return _buildTimePart(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonPart(BuildContext context, UserModel _userModel) {
    Size screenSize = MediaQuery.of(context).size;
    return FutureBuilder<List<User>>(
      future: _userModel.getConnections(_userModel.user),
      builder: (context, data) {
        if (data.hasData) {
          if(widget.fix == 1){
            filteredUsers = data.data;
          }
          widget.fix ++;
          return Container(
            alignment: Alignment.center,
            color: AppColors.koyuMor.withOpacity(1),
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: <Widget>[
                Text("Birisini Seç",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans')),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: screenSize.width / 1.7,
                      child: TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hoverColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            hintText: 'Seçmek istediğin ismin gir.',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            )),
                        onChanged: (string) {
                          _debouncer.run(() {
                            setState(() {
                              filteredUsers = data.data
                                  .where((u) => (u.name
                                  .toLowerCase()
                                  .contains(string.toLowerCase())))
                                  .toList();
                            });
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: filteredUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10, right: 15, left: 15),
                        color: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                              NetworkImage(data.data[index].profileURL),
                            ),
                            title: Text(
                              filteredUsers[index].name,
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              setState(() {
                                _userModel.connection = filteredUsers[index];
                                _selectedName = filteredUsers[index].name;
                              });

                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    _buildDialogName(context, _selectedName),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildPlacePart(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      color: AppColors.koyuMor.withOpacity(1),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsets.all(25),
              child: ListView(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(
                        "Adres Başlığı:",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _titleAddress,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 12.0),
                                borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.subtitles,
                              color: Colors.white.withOpacity(0.4),
                            ),
                            hintText: 'Örneğin: House Cafe',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(42),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: screenSize.width / 1.7,
              child: RaisedButton(
                color: AppColors.pembe.withOpacity(1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "MEKANI ONAYLA",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_titleAddress.text == "") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(
                              "Adres Başlığı Kısmını Boş Bırakmayınız.",
                              style: TextStyle(
                                  color: AppColors.koyuMor.withOpacity(1),
                                  fontFamily: 'OpenSans')),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                        );
                      },
                    );
                  } else {
                    setState(() {
                      _selectedPlace = _titleAddress.text;
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildDialogPlace(context, _selectedPlace),
                    );
                  }
                },
                elevation: 0,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget _buildDatePart(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      color: AppColors.koyuMor.withOpacity(1),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: CupertinoTheme(
              data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle:
                  TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              child: CupertinoDatePicker(
                minimumDate: DateTime.now(),
                maximumDate: DateTime(2021, 6, 30),
                backgroundColor: AppColors.koyuMor.withOpacity(1),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (date) {
                  if (date == null) {
                    return;
                  }
                  newDateTime = date;
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: screenSize.width / 1.7,
              child: RaisedButton(
                color: AppColors.pembe.withOpacity(1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "TARİHİ ONAYLA",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  String _selectedMonth = "";
                  _selectedDate = newDateTime;
                  if (_selectedDate.month == 1) {
                    _selectedMonth = "Ocak";
                  } else if (_selectedDate.month == 2) {
                    _selectedMonth = "Şubat";
                  } else if (_selectedDate.month == 3) {
                    _selectedMonth = "Mart";
                  } else if (_selectedDate.month == 4) {
                    _selectedMonth = "Nisan";
                  } else if (_selectedDate.month == 5) {
                    _selectedMonth = "Mayıs";
                  } else if (_selectedDate.month == 6) {
                    _selectedMonth = "Haziran";
                  } else if (_selectedDate.month == 7) {
                    _selectedMonth = "Temmuz";
                  } else if (_selectedDate.month == 8) {
                    _selectedMonth = "Ağustos";
                  } else if (_selectedDate.month == 9) {
                    _selectedMonth = "Eylül";
                  } else if (_selectedDate.month == 10) {
                    _selectedMonth = "Ekim";
                  } else if (_selectedDate.month == 11) {
                    _selectedMonth = "Kasım";
                  } else {
                    _selectedMonth = "Aralık";
                  }
                  setState(() {
                    _selectedDateFormat =
                    "${_selectedDate.day} $_selectedMonth ${_selectedDate.year}";
                  });

                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildDialogDate(context, _selectedDateFormat),
                  );
                },
                elevation: 0,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget _buildTimePart(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      color: AppColors.koyuMor.withOpacity(1),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: CupertinoTheme(
              data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  pickerTextStyle: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              child: CupertinoTimerPicker(
                alignment: Alignment.center,
                backgroundColor: AppColors.koyuMor.withOpacity(1),
                mode: CupertinoTimerPickerMode.hm,
                onTimerDurationChanged: (time) {
                  if (time == null) {
                    return;
                  }
                  _currentTime = time;
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: screenSize.width / 1.7,
              child: RaisedButton(
                color: AppColors.pembe.withOpacity(1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "SAATİ ONAYLA",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  String _currentHour = "0";
                  String _currentMinute = "0";
                  _selectedTime = _currentTime;

                  if (_selectedTime.inHours < 10) {
                    _currentHour = "0" + _selectedTime.inHours.toString();
                  } else {
                    _currentHour = _selectedTime.inHours.toString();
                  }
                  if (_selectedTime.inMinutes % 60 < 10) {
                    _currentMinute =
                        "0" + (_selectedTime.inMinutes % 60).toString();
                  } else {
                    _currentMinute = (_selectedTime.inMinutes % 60).toString();
                  }

                  setState(() {
                    _selectedTimeFormat = "$_currentHour : $_currentMinute";
                  });

                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildDialogTime(context, _selectedTimeFormat),
                  );
                },
                elevation: 0,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget _buildDialogName(BuildContext context, String _selectedName) {
    return AlertDialog(
      content: Text(
          " ' " +
              _selectedName +
              " '   Kişisi Buluşma Ayarlanması İçin Seçildi.",
          style: TextStyle(
              color: AppColors.koyuMor.withOpacity(1), fontFamily: 'OpenSans')),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppColors.koyuMor.withOpacity(1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          textColor: Colors.white,
          child: Text('Tamam'),
        ),
      ],
    );
  }

  Widget _buildDialogDate(BuildContext context, var _selectedDateFormat) {
    return AlertDialog(
      content: Text(
          " ' " +
              _selectedDateFormat +
              " '   Tarihi Buluşma Ayarlanması İçin Seçildi.",
          style: TextStyle(
              color: AppColors.koyuMor.withOpacity(1), fontFamily: 'OpenSans')),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppColors.koyuMor.withOpacity(1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          textColor: Colors.white,
          child: Text('Tamam'),
        ),
      ],
    );
  }

  Widget _buildDialogTime(BuildContext context, var _selectedTimeFormat) {
    return AlertDialog(
      content: Text(
          " ' " +
              _selectedTimeFormat +
              " '   Saati Buluşma Ayarlanması İçin Seçildi.",
          style: TextStyle(
              color: AppColors.koyuMor.withOpacity(1), fontFamily: 'OpenSans')),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppColors.koyuMor.withOpacity(1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          textColor: Colors.white,
          child: Text('Tamam'),
        ),
      ],
    );
  }

  Widget _buildDialogPlace(BuildContext context, var _selectedPlace) {
    return AlertDialog(
      content: Text(
          " ' " +
              _selectedPlace +
              " '   Mekanı Buluşma Ayarlanması İçin Seçildi.",
          style: TextStyle(
              color: AppColors.koyuMor.withOpacity(1), fontFamily: 'OpenSans')),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppColors.koyuMor.withOpacity(1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          textColor: Colors.white,
          child: Text('Tamam'),
        ),
      ],
    );
  }

  Widget _buildDialogSetMeeting(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.koyuMor.withOpacity(1.0),
      title: Text(
        "Onayla!",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      content: Text(
        "Az önce bir buluşma ayarladın.\nOnaylıyor musun?",
        style: TextStyle(
          color: AppColors.acikMavi.withOpacity(1),
          fontFamily: 'OpenSans',
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
            topLeft: Radius.circular(60),
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
          child: Text('İptal'),
        ),
        FlatButton(
          onPressed: () {
            print("hereeeee");
            confirmMeeting(context);
            Navigator.of(context).pop();
          },
          color: AppColors.pembe.withOpacity(1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          textColor: Colors.white,
          child: Text('Onayla'),
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
                      Icons.menu,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () => _scaffoldKey.currentState.openDrawer()),
                IconButton(
                    padding: EdgeInsets.all(20),
                    icon: Icon(
                      Icons.notifications,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "BULUŞMA  AYARLA",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void confirmMeeting(BuildContext context) async{
    final _userModel = Provider.of<UserModel>(context, listen: false);
    await _userModel.createMeeting(Meetings(meID: _userModel.user.userID,
    itID: _userModel.connection.userID, itName: _userModel.connection.name, meName: _userModel.user.name,
    where: _selectedPlace, when: _selectedDateFormat, clock: _selectedTimeFormat, isConfirmed: false, no: 1));
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
