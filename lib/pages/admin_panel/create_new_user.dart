import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/values/constants.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CreateNewUser extends StatefulWidget {
  @override
  _CreateNewUser createState() => _CreateNewUser();
}

class _CreateNewUser extends State<CreateNewUser> {
  final _mailCont = TextEditingController(text: "");
  final _nameCont = TextEditingController(text: "");
  final _typeCont = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getCustomAppBar(),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildNameSurnameTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildMentorStudentTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildSignUpBtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTF() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: secondBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              controller: _mailCont,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: AppColors.acikMor,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: AppColors.acikMor.withOpacity(0.4),
                ),
                hintText: 'E-posta',
                hintStyle: TextStyle(
                  color: AppColors.acikMor.withOpacity(0.4),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          )
        ]);
  }

  Widget _buildNameSurnameTF() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: secondBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              controller: _nameCont,
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: AppColors.acikMor,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.assignment_ind,
                  color: AppColors.acikMor.withOpacity(0.4),
                ),
                hintText: 'İsim - Soyisim',
                hintStyle: TextStyle(
                  color: AppColors.acikMor.withOpacity(0.4),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          )
        ]);
  }

  Widget _buildMentorStudentTF() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: secondBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              controller: _typeCont,
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: AppColors.acikMor,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.contact_mail,
                  color: AppColors.acikMor.withOpacity(0.4),
                ),
                hintText: 'Mentor/Öğrenci',
                hintStyle: TextStyle(
                  color: AppColors.acikMor.withOpacity(0.4),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          )
        ]);
  }

  Widget _buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(15.0),
        color: AppColors.acikMor.withOpacity(1.0),
        onPressed: () => saveUser(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Kayıt Yap',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
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
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "Kayıt Yap",
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

  void saveUser(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    try {
      User user = await _userModel.createUser(_mailCont.text, "123456");
      if (user.email != null) {
        await _userModel.resetPassword(user.email);
        await _userModel.updateUser(user.userID, {
          'name': _nameCont.text,
          'type': _typeCont.text,
          'modID': _userModel.user.userID,
          'profileURL':
              "https://firebasestorage.googleapis.com/v0/b/agucareer-01.appspot.com/o/profile-photos%2Fdefault.jpg?alt=media&token=7b51d2e6-5e86-45ba-b6a3-885cbff8205e"
        });
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertWidget.standart(
              context: context, title: "Kullanıcı oluşturulamdı!"),
          barrierDismissible: false);
    }
  }
}
