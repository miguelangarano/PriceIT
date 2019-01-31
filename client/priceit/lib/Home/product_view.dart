import 'package:flutter/material.dart';
import '../Entities/product.dart';
import 'package:file_picker/file_picker.dart';

class ProductView extends StatefulWidget{

  ProductView(this.widthToPercent, this.heightToPercent, this._callback, this._context, this._comboList);
  Function(double) widthToPercent;
  Function(double) heightToPercent;
  Function(int) _callback;
  BuildContext _context;
  List<Product> _comboList;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductViewState();
  }
}

class _ProductViewState extends State<ProductView>{

  TextEditingController _textFilePath = new TextEditingController();
  TextEditingController _textPrice = new TextEditingController();
  TextEditingController _textName = new TextEditingController();
  TextEditingController _textCont = new TextEditingController();
  TextEditingController _textContUnit = new TextEditingController();
  TextEditingController _textPlace = new TextEditingController();
  String _filePath="";

  getFile() async{
    print("get File");
    try {
      _filePath = await FilePicker.getFilePath(type: FileType.ANY);
      setState((){this._filePath = _filePath; _textFilePath.text=_filePath;});
    }catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

  submitProduct(){
    if(_textFilePath.text!="" && _textPrice.text!="" && _textName.text!="" && _textCont!="" && _textContUnit.text!="" && _textPlace.text!=""){
      print("submit product");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(left: widget.widthToPercent(10), right: widget.widthToPercent(10), top: widget.heightToPercent(10), bottom: widget.heightToPercent(5)),
        child: Column(
          children: <Widget>[
            Text("Subir Producto", style: TextStyle(fontSize: 35),),
            Container(
              margin: EdgeInsets.only(left: widget.widthToPercent(10), right: widget.widthToPercent(10), top: widget.heightToPercent(5)),
              child: getButton("Elegir Foto", getFile),
            ),
            getTextFormField(Icon(Icons.subdirectory_arrow_right), _filePath, _textFilePath, false),
            Container(
              margin: EdgeInsets.only(left: widget.widthToPercent(10), right: widget.widthToPercent(10), top: widget.heightToPercent(5)),
              child: Column(
                children: <Widget>[
                  getTextFormField(Icon(Icons.monetization_on), "Precio", _textPrice, true),
                  getTextFormField(Icon(Icons.shopping_basket), "Nombre", _textName, true),
                  getTextFormField(Icon(Icons.inbox), "Contenido", _textCont, true),
                  getTextFormField(Icon(Icons.calendar_view_day), "Unidad de Medida", _textContUnit, true),
                  getTextFormField(Icon(Icons.place), "Lugar", _textPlace, true),
                  getButton("Subir", submitProduct),
                ],
              ),
            )
          ],
        )
    );
  }

  Widget getButton(String texto, Function function) {
    return Container(
        margin: EdgeInsets.only(top: widget.heightToPercent(2.5)),
        width: widget.widthToPercent(100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                offset: Offset(-5.0, 5.0),
                blurRadius: 3,
              )
            ]
        ),
        child: RaisedButton(
          onPressed: () => function(),
          child: Text(
            texto,
            style: TextStyle(fontSize: 25),
          ),
          color: Color.fromRGBO(33, 33, 33, 1),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        )
    );
  }

  Widget getTextFormField(Icon icn, String hnt, TextEditingController controller, bool enb) {
    return new Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(left: 15),
        decoration: new BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            borderRadius: new BorderRadius.all(Radius.circular(30)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 5.0),
                blurRadius: 2.0,
              )
            ]),
        child: new Theme(
          data: Theme.of(widget._context)
              .copyWith(primaryColor: new Color.fromRGBO(255, 255, 255, 0)),
          child: new TextFormField(
            enabled: enb,
            controller: controller,
            style: new TextStyle(fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: icn,
              hintText: hnt,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        )
    );
  }
}