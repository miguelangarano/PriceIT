import 'package:flutter/material.dart';
import '../Entities/product.dart';
import '../components/list_view_combo_component.dart';

class UserView extends StatefulWidget{

  UserView(this.widthToPercent, this.heightToPercent, this._callback, this._context, this._comboList);
  Function(double) widthToPercent;
  Function(double) heightToPercent;
  Function(int) _callback;
  BuildContext _context;
  List<Product> _comboList;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserViewState();
  }
}

class _UserViewState extends State<UserView>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: widget.heightToPercent(7)),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.power_settings_new, color: Colors.black, size: 35),
                      Text("Cerrar Sesión", style: TextStyle(fontSize: 10),),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: widget.heightToPercent(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Price", style: TextStyle(fontSize: 60),),
                  Text("IT", style: TextStyle(fontSize: 100),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: widget.heightToPercent(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Miguel Langarano", style: TextStyle(fontSize: 30),),
                  Padding(padding: EdgeInsets.only(top: widget.heightToPercent(2))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.yellow, size: 30,),
                      Icon(Icons.star, color: Colors.yellow, size: 30,),
                      Icon(Icons.star, color: Colors.yellow, size: 30,),
                      Icon(Icons.star, color: Colors.grey, size: 30,),
                      Icon(Icons.star, color: Colors.grey, size: 30,),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: widget.heightToPercent(5))),
                  Text("Productos Subidos", style: TextStyle(fontSize: 20),),
                  Text("30", style: TextStyle(fontSize: 60),),
                ],
              ),
            )
          ],
        )
    );
  }
}