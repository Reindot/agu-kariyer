import 'package:agucareer/pages/home_page.dart';
import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/pages/sifremi_unuttum_widget.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../values/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _mail = "";
  String _pass = "";
  bool _rememberMe = true;

  void onSifremiUnuttumPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SifremiUnuttumWidget()));

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'E-posta',
          style: whiteTextStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: secondBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (String str) {
              _mail = str;
            },
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'E-postanı Gir',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Şifre',
          style: whiteTextStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: secondBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (String str) {
              _pass = str;
            },
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Şifreni Gir',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => this.onSifremiUnuttumPressed(context),
        child: Text(
          'Şifremi Unuttum',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: AppColors.secondaryElement,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Beni Hatırla',
            style: whiteTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(15.0),
        color: AppColors.mainSecondaryBackground,
        onLongPress: () => onLogInLongPressed(_mail, _pass, context),
        onPressed: () => onLogInPressed(_mail, _pass, context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'GİRİŞ',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.mainBackground),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 90.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Kullanıcı Girişi',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50.0),
                      _buildEmailTF(),
                      SizedBox(height: 30.0),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildRememberMeCheckbox(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildLoginBtn(context),
                      _buildForgotPasswordBtn(),
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

  void onLogInPressed(String mail, String pass, BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    try {
      User user = await _userModel.signIn(_mail, _pass);
      if (user != null)
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      debugPrint("ERROR login_page ${e.toString()}");
    }
  }

  void onLogInLongPressed(String mail, String pass, BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    try {
      await _userModel.createUser(_mail, _pass);
    } catch (e) {
      debugPrint("ERROR login_page ${e.toString()}");
    }
  }
}
