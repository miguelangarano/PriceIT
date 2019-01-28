import 'package:flutter/material.dart';
import '../Entities/product.dart';
import '../components/list_view_combo_component.dart';

class SaleView extends StatefulWidget{

  SaleView(this.widthToPercent, this.heightToPercent, this._callback, this._context, this._comboList);
  Function(double) widthToPercent;
  Function(double) heightToPercent;
  Function(int) _callback;
  BuildContext _context;
  List<Product> _comboList;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SaleViewState();
  }
}

class _SaleViewState extends State<SaleView>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: ListViewComboComponent(widget.widthToPercent, widget.heightToPercent, widget._callback, widget._context, widget._comboList)
    );
  }
}