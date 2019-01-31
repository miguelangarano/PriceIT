import 'package:flutter/material.dart';
import 'login_view.dart';
import 'register_view.dart';
import 'reset_view.dart';
import '../Entities/user.dart';

class LoginMain extends StatefulWidget{

  LoginMain(this.callbackRoot, this.callbackUser);
  Function(int) callbackRoot;
  Function(User) callbackUser;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginMainState();
  }
}

class _LoginMainState extends State<LoginMain>{
  MediaQueryData _queryData;
  int _whereiam=0;
  bool _value=true;

  double widthToPercent(double value) {
    double ret = (value * _queryData.size.width) / 100;
    //print(ret);
    return ret;
  }

  double heightToPercent(double value) {
    double ret = (value * _queryData.size.height) / 100;
    //print(ret);
    return ret;
  }

  callback(int value){
    setState(() {
      _whereiam=value;
    });
  }

  void _onChanged(bool value){
    setState(() {
      _value=value;
      if(value){
        _whereiam=0;
      }else{
        _whereiam=1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _queryData = MediaQuery.of(context);
    // TODO: implement build
    //return LoginView(widthToPercent, heightToPercent, callback);
    if(_whereiam==0){
      return MainView();
    }else if(_whereiam==1){
      return SecondView();
    }else if(_whereiam==2){
      return ThirdView();
    }
  }

  Widget MainView(){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          //width: widthToPercent(100),
          //height: heightToPercent(100),
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Color.fromRGBO(255, 255, 255, 1),
                    Color.fromRGBO(255, 255, 255, 1),
                  ],
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(heightToPercent(4))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Price", style: TextStyle(fontSize: 80),),
                      Text("IT", style: TextStyle(fontSize: 120),),
                    ],
                  ),
                  Switch(value: _value, onChanged: (bool value){_onChanged(value);}, activeColor: Color.fromRGBO(33, 33, 33, 1),),
                  LoginView(widthToPercent, heightToPercent, callback, context, widget.callbackRoot, widget.callbackUser)
                ],
              ),
            )
        ),
      ),
    );
  }

  Widget SecondView(){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          //width: widthToPercent(100),
          //height: heightToPercent(100),
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Color.fromRGBO(255, 255, 255, 1),
                    Color.fromRGBO(255, 255, 255, 1),
                  ],
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(heightToPercent(4))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Price", style: TextStyle(fontSize: 80),),
                      Text("IT", style: TextStyle(fontSize: 120),),
                    ],
                  ),
                  Switch(value: _value, onChanged: (bool value){_onChanged(value);}, inactiveTrackColor: Color.fromRGBO(33, 33, 33, 1), activeTrackColor: Color.fromRGBO(33, 33, 33, 1), inactiveThumbColor: Color.fromRGBO(33, 33, 33, 1),),
                  RegisterView(widthToPercent, heightToPercent, callback, context)
                ],
              ),
            )
        ),
      ),
    );
  }

  Widget ThirdView(){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          //width: widthToPercent(100),
          //height: heightToPercent(100),
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Color.fromRGBO(255, 255, 255, 1),
                    Color.fromRGBO(255, 255, 255, 1),
                  ],
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(heightToPercent(4))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Price", style: TextStyle(fontSize: 80),),
                      Text("IT", style: TextStyle(fontSize: 120),),
                    ],
                  ),
                  ResetView(widthToPercent, heightToPercent, callback, context)
                ],
              ),
            )
        ),
      ),
    );
  }

}