import 'package:flutter/material.dart';
import 'user_view.dart';
import 'product_view.dart';
import 'sale_view.dart';
import '../Entities/product.dart';
import '../Entities/user.dart';
import 'package:swipedetector/swipedetector.dart';


class HomeMain extends StatefulWidget{

  HomeMain(this.callbackRoot, this.callbackUser);
  Function(int) callbackRoot;
  Function(User) callbackUser;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeMainState();
  }
}

class _HomeMainState extends State<HomeMain>{
  MediaQueryData _queryData;
  int _whereiam=0;
  List<Product> _productList = new List();


  double widthToPercent(double value) {
    double ret = (value * _queryData.size.width) / 100;
    print(_queryData.size.width);
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

  onIconPressed(int val){
    callback(val);
  }

  @override
  Widget build(BuildContext context) {
    Product value = new Product("12345", "http://nada.com/image.jpg", "Miguel Langarano", 3.75, 4, "Detergente Mas", "Quicentro Norte", 300, "gr", DateTime.now());
    _productList.clear();
    _productList.add(value);
    _productList.add(value);
    _productList.add(value);
    _productList.add(value);
    _productList.add(value);
     _queryData = MediaQuery.of(context);
    // TODO: implement build
    if(_whereiam==-1){
      return SwipeDetector(
        child: FirstView(),
        onSwipeLeft: () {
          setState(() {
            if(_whereiam<1){
              _whereiam++;
            }
          });
        },
        onSwipeRight: () {
          setState(() {
            if(_whereiam>-1){
              _whereiam--;
            }
          });
        },
      );
    }else if(_whereiam==0){
      return SwipeDetector(
        child: MainView(),
        onSwipeLeft: () {
          setState(() {
            if(_whereiam<1){
              _whereiam++;
            }
          });
        },
        onSwipeRight: () {
          setState(() {
            if(_whereiam>-1){
              _whereiam--;
            }
          });
        },
      );
    }else if(_whereiam==1){
      return SwipeDetector(
        child: SecondView(),
        onSwipeLeft: () {
          setState(() {
            if(_whereiam<1){
              _whereiam++;
            }
          });
        },
        onSwipeRight: () {
          setState(() {
            if(_whereiam>-1){
              _whereiam--;
            }
          });
        },
      );
    }
  }

  Widget MainView(){
    return MaterialApp(
      home: Scaffold(
        body: Container(
            width: widthToPercent(100),
            height: heightToPercent(100),
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: widthToPercent(100),
                  height: heightToPercent(94),
                  child: SaleView(widthToPercent, heightToPercent, callback, context, _productList),
                ),
                Container(
                    width: widthToPercent(100),
                    height: heightToPercent(6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, -4),
                            blurRadius: 10.0,
                          ),
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => onIconPressed(-1),
                          child: Icon(Icons.perm_identity, color: Colors.grey, size: 30),
                        ),
                        GestureDetector(
                          onTap: () => onIconPressed(0),
                          child: Icon(Icons.search, color: Colors.black, size: 30),
                        ),
                        GestureDetector(
                          onTap: () => onIconPressed(1),
                          child: Icon(Icons.camera_alt, color: Colors.grey, size: 30),
                        ),
                      ],
                    )
                )
              ],
            )
        ),
      ),
    );
  }

  Widget FirstView(){
    return MaterialApp(
      home: Scaffold(
        body: Container(
            width: widthToPercent(100),
            height: heightToPercent(100),
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: widthToPercent(100),
                  height: heightToPercent(94),
                  color: Colors.white,
                  child: UserView(widthToPercent, heightToPercent, callback, context, _productList),
                ),
                Container(
                    width: widthToPercent(100),
                    height: heightToPercent(6),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => onIconPressed(-1),
                          child: Icon(Icons.perm_identity, color: Colors.black, size: 30),
                        ),
                        GestureDetector(
                          onTap: () => onIconPressed(0),
                          child: Icon(Icons.search, color: Colors.grey, size: 30),
                        ),
                        GestureDetector(
                          onTap: () => onIconPressed(1),
                          child: Icon(Icons.camera_alt, color: Colors.grey, size: 30),
                        ),
                      ],
                    )
                )
              ],
            )
        ),
      ),
    );
  }

  Widget SecondView(){
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
            width: widthToPercent(100),
            height: heightToPercent(100),
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: widthToPercent(100),
                  height: heightToPercent(94),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: ProductView(widthToPercent, heightToPercent, callback, context, _productList),
                  )
                ),
                Container(
                    width: widthToPercent(100),
                    height: heightToPercent(6),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => onIconPressed(-1),
                          child: Icon(Icons.perm_identity, color: Colors.grey, size: 30),
                        ),
                        GestureDetector(
                          onTap: () => onIconPressed(0),
                          child: Icon(Icons.search, color: Colors.grey, size: 30),
                        ),
                        GestureDetector(
                          onTap: () => onIconPressed(1),
                          child: Icon(Icons.camera_alt, color: Colors.black, size: 30,),
                        ),
                      ],
                    )
                )
              ],
            )
        ),
      ),
    );
  }
}