import 'package:flutter/material.dart';
import '../components/search_bar.dart';
import '../components/combo_container.dart';
import '../Entities/product.dart';

class ListViewComboComponent extends StatefulWidget{

  ListViewComboComponent(this.widthToPercent, this.heightToPercent, this._callback, this._context, this._comboList);
  Function(double) widthToPercent;
  Function(double) heightToPercent;
  Function(int) _callback;
  BuildContext _context;
  List<Product> _comboList;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListViewComboComponentState();
  }

}

class _ListViewComboComponentState extends State<ListViewComboComponent>{

  TextEditingController _searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
        child: Column(
          children: <Widget>[
            SearchBar(widget.widthToPercent, widget.heightToPercent, widget._callback, widget._context, _searchController, Icon(Icons.search, color: Colors.black,), "Buscar"),
            Container(
                margin: EdgeInsets.only(left: widget.widthToPercent(3), right: widget.widthToPercent(3), top: widget.heightToPercent(5), bottom: widget.heightToPercent(3)),
                height: widget.heightToPercent(66),
                child: Grids()
            )
          ],
        )
    );
  }

  Widget Grids(){
    if(widget.widthToPercent(100)>=360){
      print("Cant: "+widget._comboList.length.toString());
      return GridView.count(
        childAspectRatio: (1 / 0.5),
        crossAxisSpacing: 10,
        padding: EdgeInsets.only(left: widget.widthToPercent(8), right: widget.widthToPercent(8)),
        mainAxisSpacing: 25,
        // crossAxisCount is the number of columns
        crossAxisCount: 1,
        // This creates two columns with two items in each column
        children: List.generate(widget._comboList.length, (index) {
          return ComboContainer(widget.widthToPercent, widget.heightToPercent, widget._callback, widget._context, widget._comboList[index]);
        }),
      );
    }else{
      print("Cant: "+widget._comboList.length.toString());
      return GridView.count(
        childAspectRatio: (1 / 0.5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 25,
        padding: EdgeInsets.only(left: widget.widthToPercent(5), right: widget.widthToPercent(5)),
        // crossAxisCount is the number of columns
        crossAxisCount: 1,
        // This creates two columns with two items in each column
        children: List.generate(widget._comboList.length, (index) {
          return ComboContainer(widget.widthToPercent, widget.heightToPercent, widget._callback, widget._context, widget._comboList[index]);
        }),
      );
    }
  }
}