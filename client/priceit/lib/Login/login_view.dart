import 'package:flutter/material.dart';

class LoginView extends StatefulWidget{

  LoginView(this.widthToPercent, this.heightToPercent, this._callback, this._context, this.callbackRoot);
  Function(double) widthToPercent;
  Function(double) heightToPercent;
  Function(int) callbackRoot;
  Function(int) _callback;
  BuildContext _context;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginViewState();
  }

}

class _LoginViewState extends State<LoginView>{
  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();

  submitButtonPressed(){
    if(_emailController.text!="" && _passwordController.text!=""){
      print("ok");
      widget.callbackRoot(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: widget.widthToPercent(20), right: widget.widthToPercent(20)),
      child: Form(
          child: Column(
            children: <Widget>[
              getTextFormField(Icon(Icons.mail, color: Colors.black,), 'Correo', 'Correo', _emailController, false),
              getTextFormField(Icon(Icons.https, color: Colors.black,), 'Contraseña', 'Contraseña', _passwordController, true),
              getSubmitButton('Ingresar'),
              getSecondaryButton('¿Olvidaste tu contraseña?', '¡Recuperala!', Color.fromRGBO(89, 170, 192, 1), 13, 2)
            ],
          )
      ),
    );
  }


  Widget getTextFormField(Icon icn, String hnt, String lbl, TextEditingController controller, bool obscure) {
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
            controller: controller,
            obscureText: obscure,
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

  Widget getSubmitButton(String texto) {
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
          onPressed: () => submitButtonPressed(),
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

  Widget getSecondaryButton(String texto1, String texto2, Color colr, double val, int value){
    return Container(
      child: FlatButton(
        onPressed: (){widget._callback(value);},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
                opacity: 0.7,
                child: Text(
                  texto1,
                  style: TextStyle(color: Colors.black, fontSize: 10),
                )
            ),
            Opacity(
              opacity: 0.7  ,
              child: Text(
                texto2,
                style: TextStyle(color: colr, fontSize: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}