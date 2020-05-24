import 'dart:io';
import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/values/colors.dart';
import 'package:agucareer/viewmodels/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _profilePhoto;

  void _pictureFromGallery() async {
    var _newPhoto = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _profilePhoto = _newPhoto;
      Navigator.of(context).pop();
    });
  }

  void _pictureFromCamera() async {
    var _newPhoto = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _profilePhoto = _newPhoto;
      Navigator.of(context).pop();
    });
  }

  void _uploadPhoto() async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    if (_profilePhoto != null) {
      await _userModel.uploadProfilePhoto(
          _userModel.user.userID, _profilePhoto);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    final _userModel = Provider.of<UserModel>(context, listen: false);
    User _user = _userModel.user;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: _uploadPhoto,
      ),
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenSize.height / 6.4),
                  _buildProfileImage(_user),
                  Text("Değiştir", style: TextStyle(color: Colors.grey.shade600)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _user.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 26),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                _user.type.toString(),
                                style: TextStyle(color: Colors.grey.shade600),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                _user.company,
                                style: TextStyle(color: Colors.grey.shade600),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: AppColors.acikMor.withOpacity(0.9),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RotationTransition(
                                  turns: new AlwaysStoppedAnimation(45 / 360),
                                  child: Icon(
                                    Icons.navigation,
                                    size: 26,
                                    color: Colors.white
                                  ),
                                ),
                                Text(
                                  "Mesaj At",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  Container(
                    height: screenSize.height/2.3,
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: AppColors.koyuMor.withOpacity(1.0),
                    ),
                    child: ListView(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(15),
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                                color: AppColors.pembe.withOpacity(0.9),
                              ),
                              child: Text(
                                "    " + _user.professional+ "    ",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],

                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "HAKKIMDA",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10 ,
                        ),
                        Text(
                          _user.bio,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoverImage(Size screenSize) {
    return Opacity(
      opacity: 0.9,
      child: Container(
      height: screenSize.height / 3.5,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/profile_background.png'),
        fit: BoxFit.cover,
      )),
    ));
  }

  Widget _buildProfileImage(User _user) {
    return Container(
      //  color: Colors.white,
      width: 140.0,
      height: 145.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90.0),
        border: Border.all(
          color: Colors.white,
          width: 6.0,
        ),
      ),
      child: Column(
        children: <Widget>[
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 120,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.camera),
                                title: Text("Kameradan Çek"),
                                onTap: () {
                                  _pictureFromCamera();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.image),
                                title: Text("Galeriden Seç"),
                                onTap: () {
                                  _pictureFromGallery();
                                },
                              )
                            ],
                          ),
                        );
                      });
                },
                child: CircleAvatar(
                  radius:65,
                  backgroundImage: _profilePhoto == null
                      ? NetworkImage(_user.profileURL)
                      : FileImage(_profilePhoto),
                ),
              ),

        ],
      ),
    );
  }
}
