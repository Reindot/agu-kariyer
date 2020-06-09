import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/pages/sifremi_unuttum_widget.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:agucareer/widgets/alert_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../values/colors.dart';
import '../values/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = true;
  TextEditingController mailController;
  TextEditingController passController;

  final storage = new FlutterSecureStorage();

  @override
  void dispose() {
    mailController.dispose();
    passController.dispose();
    super.dispose();
  }

  void onSifremiUnuttumPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SifremiUnuttumWidget()));

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
                    vertical: 90.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.acikMor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          '      Kullanıcı Girişi       ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      _buildEmailTF(),
                      SizedBox(height: 10.0),
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

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            future: getSavedEmail(),
            builder: (context, result) {
              debugPrint(">>> login_page >>> _buildEmailTF >>> savedMail >>> ${result.data}");
              mailController = TextEditingController(text: result.data);
              if(result.hasData){
                return TextFormField(
                  cursorColor: AppColors.acikMor.withOpacity(0.8),
                  controller: mailController,
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
                    hintText: 'E-postanı Gir',
                    hintStyle: TextStyle(
                      color: AppColors.acikMor.withOpacity(0.4),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                );
              } else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 25.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: secondBoxDecorationStyle,
          height: 50.0,
          child: FutureBuilder<String>(
            future: getSavedPass(),
            builder: (context, result){
              passController = TextEditingController(text: result.data);
              if(result.hasData){
                return TextFormField(
                  cursorColor: AppColors.acikMor.withOpacity(0.8),
                  controller: passController,
                  obscureText: true,
                  style: TextStyle(
                    color: AppColors.acikMor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: AppColors.acikMor.withOpacity(0.4),
                    ),
                    hintText: 'Şifreni Gir',
                    hintStyle: TextStyle(
                      color: AppColors.acikMor.withOpacity(0.4),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
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
            color: AppColors.acikMor.withOpacity(0.8),
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
            data: ThemeData(unselectedWidgetColor: AppColors.acikMor),
            child: Checkbox(
              value: _rememberMe,
              activeColor: AppColors.acikMor,
              checkColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Beni Hatırla',
            style: purpleTextStyle,
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
        color: AppColors.acikMor.withOpacity(0.8),
        onPressed: () => onLogInPressed(mailController.text, passController.text, context),
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

  void onLogInPressed(String mail, String pass, BuildContext context) async {
    updateLoginData();
    final _userModel = Provider.of<UserModel>(context, listen: false);
    try {
      User user = await _userModel.signIn(mailController.text, passController.text);
      if (user != null){

      }
        Navigator.pushReplacementNamed(context, _userModel.user.type == "MOD" ? '/adminHome' : '/home');
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertWidget.standart(
              context: context, title: "Kullanıcı adı veya şifre hatalı!"),
          barrierDismissible: false);
    }
  }

  void updateLoginData() async {
    if (_rememberMe) {
      await storage.write(key: "_mail", value: mailController.text);
      await storage.write(key: "_pass", value: passController.text);
    } else {
      await storage.deleteAll();
    }
  }

  Future<String> getSavedEmail() async {
    return await storage.read(key: "_mail") ?? "";
  }

  Future<String> getSavedPass() async {
    return await storage.read(key: "_pass") ?? "";
  }

}