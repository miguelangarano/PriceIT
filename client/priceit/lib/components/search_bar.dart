import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget{

  SearchBar(this.widthToPercent, this.heightToPercent, this._callback, this._context, this._controller, this._icn, this._hnt);
  Function(double) widthToPercent;
  Function(double) heightToPercent;
  Function(int) _callback;
  BuildContext _context;
  TextEditingController _controller;
  Icon _icn;
  String _hnt;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBar>{

  onCartTapped(){
    print("Go to shopping cart");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: widget.heightToPercent(10), left: widget.widthToPercent(5), right: widget.widthToPercent(5)),
      width: widget.widthToPercent(100),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
                padding: EdgeInsets.only(left: 15),
                decoration: new BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: new BorderRadius.all(Radius.circular(30)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 5.0),
                        blurRadius: 5.0,
                      )
                    ]
                ),
                child: new Theme(
                  data: Theme.of(widget._context)
                      .copyWith(primaryColor: new Color.fromRGBO(255, 255, 255, 0)),
                  child: new TextFormField(
                    controller: widget._controller,
                    style: new TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: widget._icn,
                      hintText: widget._hnt,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

}