import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class OrderedItemCard extends StatelessWidget {
  const OrderedItemCard({
    Key key,
    this.numOfItem,
    @required this.title,
    @required this.description,
    @required this.price,
  }) : super(key: key);
  final int numOfItem;
  final String title, description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildNumOfItem(),
            HorizontalSpacing(of: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  VerticalSpacing(of: 5),
                  Text(
                    description,
                    style: kBodyTextStyle.copyWith(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            HorizontalSpacing(of: 10),
            Text(
              "$price",
              style: kCaptionTextStyle.copyWith(color: kActiveColor),
            )
          ],
        ),
        VerticalSpacing(of: 10),
        Divider(),
      ],
    );
  }

  void toastMessage(String str) {
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 25.0);
  }

  Container buildNumOfItem() {
    return Container(
      height: 24,
      width: 70,
      alignment: Alignment.center,
      child: Row(
        children: [
          GestureDetector(
              child: Icon(Icons.check_circle, color: Colors.green),
              onTap: () {
                toastMessage("Rezervasyon onaylandı.");
              }),
          HorizontalSpacing(of: 20),
          GestureDetector(
              child: Icon(Icons.cancel, color: Colors.red),
              onTap: () {
                toastMessage("Rezervasyon reddedildi.");
              }),
        ],
      ),
    );
  }
}
