import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _displayTextInputDialog(BuildContext context) async {
      String _email;
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(10),
              title: Center(child: Text('Ürün ekle')),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Container(
                height: 350,
                width: 700,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Ürün adı"),
                      TextFormField(
                        //autovalidate: _autoValidate,
                        //validator: ,
                        //onChanged: (value) => _email = value,
                        //controller: ,
                        decoration:
                            InputDecoration(hintText: "Ürün adını giriniz."),
                      ),
                      Text("Kategori"),
                      TextFormField(
                        //autovalidate: _autoValidate,
                        //validator: ,
                        //onChanged: (value) => _email = value,
                        //controller: ,
                        decoration: InputDecoration(
                            hintText: "Ürün kategorisini giriniz."),
                      ),
                      Text("Açıklama"),
                      TextFormField(
                        //autovalidate: _autoValidate,
                        //validator: ,
                        //onChanged: (value) => _email = value,
                        //controller: ,
                        decoration:
                            InputDecoration(hintText: "Malzemeleri giriniz."),
                      ),
                      Text("Fiyat"),
                      TextFormField(
                        //autovalidate: _autoValidate,
                        //validator: ,
                        //onChanged: (value) => _email = value,
                        //controller: ,
                        decoration: InputDecoration(
                            hintText: "Ürünün fiyatını giriniz."),
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: MaterialButton(
                    shape: StadiumBorder(),
                    minWidth: 100,
                    color: Colors.orange[400],
                    child:
                        new Text("Ekle", style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  ),
                ),
              ],
            );
          });
    }

    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Spacer(),
          Center(
            child: Container(
              height: 130,
              width: 300,
              child: Image.asset("assets/images/NeYesek_banner.png"),
            ),
          ),
          Spacer(),
          Container(
              child: Center(
            child: Text("Bilkent Pizza",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.orange[400])),
          )),
          Spacer(),
          Center(
            child: GestureDetector(
              onTapDown: (c) {
                _displayTextInputDialog(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 70,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x80000000),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 5.0),
                      ),
                    ],
                    color: Colors.orange[300]),
                child: Center(
                  child: Text(
                    'ÜRÜN EKLE',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Center(
            child: GestureDetector(
              onTapDown: (c) {
                //CODE HERE
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 70,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x80000000),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 5.0),
                      ),
                    ],
                    color: Colors.orange[300]),
                child: Center(
                  child: Text(
                    'ÜRÜNLERİ DÜZENLE',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Center(
            child: GestureDetector(
              onTapDown: (c) {
                //CODE HERE
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 70,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x80000000),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 5.0),
                      ),
                    ],
                    color: Colors.orange[300]),
                child: Center(
                  child: Text(
                    'MENÜYÜ GÖSTER',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
        ]));
  }
}
