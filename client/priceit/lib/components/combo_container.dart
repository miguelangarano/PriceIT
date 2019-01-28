import 'package:flutter/material.dart';
import '../Entities/product.dart';

class ComboContainer extends StatefulWidget{

  ComboContainer(this.widthToPercent, this.heightToPercent, this._callback, this._context, this._combo);
  Function(double) widthToPercent;
  Function(double) heightToPercent;
  Function(int) _callback;
  BuildContext _context;
  Product _combo;

  @override
  State<StatefulWidget> createState() {
    print(_combo.price);
    // TODO: implement createState
    return _ComboContainerState();
  }
}

class _ComboContainerState extends State<ComboContainer>{

  int _quantity=1;

  addToCart(String id, int quantity){
    print("Added to cart "+id+" "+quantity.toString());
  }

  onTapPlus(int id){
    if(_quantity<9){
      setState(() {
        _quantity++;
      });
    }
  }

  onTapLess(int id){
    if(_quantity>1){
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 10,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(30)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 5.0),
              blurRadius: 5.0,
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(widget._combo.name),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        width: 150,
                        height: 80,
                        child: Image.asset('assets/combo.jpg', ),
                      ),
                      Container(
                        child: Text("\$"+widget._combo.price.toString()),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: widget.heightToPercent(10),
                          width: widget.widthToPercent(35),
                          child: GridView.count(
                            childAspectRatio: (1 / 0.20),
                            crossAxisSpacing: 10,
                            padding: EdgeInsets.only(left: 3, right: 3),
                            mainAxisSpacing: 0.1,
                            // crossAxisCount is the number of columns
                            crossAxisCount: 1,
                            // This creates two columns with two items in each column
                            children: List.generate(1, (index) {
                              return Column(
                                children: <Widget>[
                                  Text("Cont: "+widget._combo.content.toString()+" "+widget._combo.contentUnit, style: TextStyle(fontSize: 10),),
                                  Text("Precio: \$"+widget._combo.price.toString(), style: TextStyle(fontSize: 10),),
                                  Text("Tienda: "+widget._combo.place, style: TextStyle(fontSize: 10),),
                                  Text("Fecha: "+widget._combo.date.toLocal().toString(), style: TextStyle(fontSize: 10),),
                                  Text("Subido por: "+widget._combo.username, style: TextStyle(fontSize: 10),),
                                ],
                              );
                            }),
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Text("Cantidad", style: TextStyle(fontSize: 7),),
                                  Container(
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
                                    child: Row(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () => onTapPlus(0),
                                          child: Icon(Icons.add_circle, color: Colors.black, size: 20,),
                                        ),
                                        Padding(padding: EdgeInsets.all(2),),
                                        Text(_quantity.toString()),
                                        Padding(padding: EdgeInsets.all(2),),
                                        GestureDetector(
                                          onTap: () => onTapLess(0),
                                          child: Icon(Icons.remove_circle, color: Colors.black, size: 20,),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => addToCart(widget._combo.id, _quantity),
                              child: Container(
                                margin: EdgeInsets.only(left: 18),
                                padding: EdgeInsets.all(3.5),
                                decoration: new BoxDecoration(
                                    color: Color.fromRGBO(31, 31, 31, 0.8),
                                    borderRadius: new BorderRadius.all(Radius.circular(100)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Color.fromRGBO(31, 31, 31,0.8),
                                        offset: Offset(0.0, 3.0),
                                        blurRadius: 5.0,
                                      )
                                    ]
                                ),
                                child: Icon(Icons.add_shopping_cart, color: Colors.white, size: 24,),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}