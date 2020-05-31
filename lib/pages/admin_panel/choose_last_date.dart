import 'package:agucareer/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseLastDate extends StatefulWidget {
  @override
  _ChooseLastDate createState() => _ChooseLastDate();
}
class _ChooseLastDate extends State<ChooseLastDate> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DateTime _selectedDate;
  DateTime newDateTime = DateTime.now();
  var _selectedDateFormat;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.koyuMor.withOpacity(1),
      appBar: _getCustomAppBar(),
      body: Builder(
          builder: (context){
            return _buildDatePart(context);
          },
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
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "Son Tarih Belirle",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.koyuMor.withOpacity(1.0),
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}