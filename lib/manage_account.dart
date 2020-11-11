import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainScreen extends StatefulWidget {
  final Map user ;
  final bool biometricLogin;
  MainScreen({Key key, @required this.user,@required this.biometricLogin}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    setSharedPreferences();
    // TODO: implement initState
    super.initState();
  }
  setSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool biometricRegistered = prefs.containsKey('biometricRegistered');
    if(!biometricRegistered){
      Fluttertoast.showToast(
          msg: "Biometric Enabled ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      prefs.setBool('biometricRegistered', true);
      prefs.setString('first_name',widget.user["data"]["first_name"]);
      prefs.setString('last_name',widget.user["data"]["last_name"]);
      prefs.setString('email',widget.user["data"]["email"]);

    }
    print(prefs.getString('first_name'));
    print(prefs.getString('last_name'));
    print(prefs.getString('email'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "MANAGE ACCOUNT",
        ),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            color: Colors.blue,
            label: Text('LogOut'),//LogOut
            icon: Icon(Icons.power_settings_new),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return LoginPage();
                  },
                ),
              );
            },
          )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "ACCOUNT DETAILS",
                  style: TextStyle(
//                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.biometricLogin?widget.user['first_name']:widget.user["data"]["first_name"],
                  style: TextStyle(
//                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.biometricLogin?widget.user['last_name']:widget.user["data"]["last_name"],
                  style: TextStyle(
//                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.biometricLogin?widget.user['email']:widget.user["data"]["email"],
                  style: TextStyle(
//                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
