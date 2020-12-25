import 'package:flutter/material.dart';
import 'package:food_ui_kit/screens/home/home_screen.dart';
import 'package:food_ui_kit/screens/search/search_screen.dart';
import 'package:food_ui_kit/screens/search/components/body.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/section_title.dart';
import '../../../dummy.dart';

class PriceRange extends StatefulWidget {
  @override
  _PriceRangeState createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
  RangeValues _currentRangeValues = const RangeValues(20, 40);
  RangeValues _currentRatingValues = const RangeValues(7.5, 9.0);

  BodyState bs = new BodyState();

  void filteredSearchButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(),
      ),
    );

    filter_rating = true;
    filter_price = true;

    start_rating = _currentRatingValues.start;
    end_rating = _currentRatingValues.end;

    start_price = _currentRangeValues.start;
    end_price = _currentRangeValues.end;
  }

  void changeValue(RangeValues values) {
    setState(() {
      _currentRangeValues = values;
    });
  }

  void changeRating(RangeValues rating) {
    setState(() {
      _currentRatingValues = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: "Fiyat Aralığı",
          press: () {},
          isMainSection: false,
        ),
        VerticalSpacing(),
        RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 100,
            divisions: 100,
            labels: RangeLabels(_currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString()),
            onChanged: changeValue),
        VerticalSpacing(),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Min: " + _currentRangeValues.start.toStringAsFixed(0) + "₺",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              Text(
                "Maks: " + _currentRangeValues.end.toStringAsFixed(0) + "₺",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black54),
              ),
            ],
          ),
        ),
        VerticalSpacing(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: "Puan Aralığı",
              press: () {},
              isMainSection: false,
            ),
            VerticalSpacing(),
            RangeSlider(
                values: _currentRatingValues,
                min: 0,
                max: 10,
                divisions: 100,
                labels: RangeLabels(
                    _currentRatingValues.start.round().toString(),
                    _currentRatingValues.end.round().toString()),
                onChanged: changeRating),
            VerticalSpacing(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Min: " +
                        _currentRatingValues.start.toStringAsFixed(1) +
                        " ☆",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                  Text(
                    "Maks: " +
                        _currentRatingValues.end.toStringAsFixed(1) +
                        " ☆",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ],
              ),
            ),
            VerticalSpacing(),
            Column(),
          ],
        ),
        Center(
          child: RaisedButton(
            color: Colors.green[700],
            child: Text(
              "ARA",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: filteredSearchButton,
          ),
        )
      ],
    );
  }
}
/*
class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    this.isActive = false,
    @required this.index,
    @required this.press,
  }) : super(key: key);

  final bool isActive;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(64),
      width: getProportionateScreenWidth(64),
      child: FlatButton(
        padding: EdgeInsets.zero,
        color: isActive ? kActiveColor : kInputColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(
              color: isActive ? kActiveColor : kBodyTextColor.withOpacity(0.1)),
        ),
        onPressed: press,
        child: Text(
          "asdadadsdsadas" * (index + 1),
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: isActive ? Colors.blue : kMainColor,
              fontSize: getProportionateScreenWidth(14)),
        ),
      ),
    );
  }
}*/
