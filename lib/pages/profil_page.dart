import 'dart:io';
import 'package:agucareer/models/user_model.dart';
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
    if(_profilePhoto != null) {
      await _userModel.uploadProfilePhoto(_userModel.user.userID, _profilePhoto);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    User _user = _userModel.user;

    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: _uploadPhoto,
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                color: Colors.white,
                elevation: 0,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
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
                            radius: 50,
                            backgroundImage: _profilePhoto == null
                                ? NetworkImage(_user.profileURL)
                                : FileImage(_profilePhoto),
                          ),
                        )),
                    Text("Değiştir",
                        style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
              ),
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
                          color: Colors.purple.shade900,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.message,
                              color: Colors.white,
                            ),
                            Text(
                              "Mesaj At",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  )
                ],
              ),
              Container(
                height: 250,
                width: 275,
                padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Colors.purple.shade900,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
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
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Colors.blue,
                          ),
                          child: Text(
                            _user.professional,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      _user.bio,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
