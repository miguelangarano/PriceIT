import 'package:flutter/material.dart';
import './Login/login_main.dart';
import './Home/home_main.dart';
import './Entities/user.dart';


class RootMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RootMainState();
  }
}

class _RootMainState extends State<RootMain>{
  int _whereiam=0;
  User _user;

  callbackRoot(int value){
    setState(() {
      _whereiam=value;
    });
  }

  callbackUser(User user){
    setState(() {
      _user=user;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //return LoginView(widthToPercent, heightToPercent, callback);
    if(_whereiam==0){
      return LoginMain(callbackRoot, callbackUser);
    }else if(_whereiam==1){
      return HomeMain(callbackRoot, callbackUser);
    }
  }
}