import 'package:flutter/material.dart';
import 'components/comment_rating.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 130,
              width: 300,
              child: Image.asset("assets/images/NeYesek_banner.png"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Karışık Pizza",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text("Ne Yesek Pizza",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("Puan: 4.7"), Text("Puan: 4.2")],
          ),
          Spacer(),
          Rating((rating) {
            setState(() {
              _rating = rating;
            });
          }),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              autocorrect: true,
              enableSuggestions: true,
              maxLines: 7,
              //keyboardType: TextInputType.multiline,
              decoration: InputDecoration.collapsed(
                  hintText: "Yorumunuzu buraya giriniz..."),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTapDown: (c) {
              Fluttertoast.showToast(
                  msg: "Yorumunuz başarıyla gönderildi!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 25.0);
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              width: 150,
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
                  'GÖNDER',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    ));
  }
}
