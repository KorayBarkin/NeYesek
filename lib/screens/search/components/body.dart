import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui_kit/components/cards/big/restaurant_info_big_card.dart';
import 'package:food_ui_kit/components/scalton/big_card_scalton.dart';
import 'package:food_ui_kit/constants.dart';
import 'package:food_ui_kit/size_config.dart';
import '../../../demoData.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<RestaurantInfoBigCard> myList;
  List<RestaurantInfoBigCard> searchList;
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _showSearchResult = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    myList = new List<RestaurantInfoBigCard>();
    searchList = new List<RestaurantInfoBigCard>();
    searchList.add(new RestaurantInfoBigCard(
        name: "Ne Yesek Burger",
        rating: 7.2,
        numOfRating: 231,
        deliveryTime: 20,
        image: null,
        foodType: ["Fastfood", "Türk"],
        press: null));
    searchList.add(new RestaurantInfoBigCard(
        name: "Pizza Hut",
        rating: 4.5,
        numOfRating: 231,
        deliveryTime: 20,
        image: null,
        foodType: ["Fastfood", "İtalyan"],
        press: null));
    searchList.add(new RestaurantInfoBigCard(
        name: "Burger King",
        rating: 5.1,
        numOfRating: 231,
        deliveryTime: 20,
        image: null,
        foodType: ["Fastfood", "Amerikan"],
        press: null));
    searchList.add(new RestaurantInfoBigCard(
        name: "Ne Yesek Pizza",
        rating: 9.4,
        numOfRating: 231,
        deliveryTime: 20,
        image: null,
        foodType: ["Fastfood", "Türk"],
        press: null));
    myList.add(new RestaurantInfoBigCard(
        name: "Ne Yesek Pizza",
        rating: 9.4,
        numOfRating: 231,
        deliveryTime: 20,
        image: null,
        foodType: ["Fastfood", "Türk"],
        press: null));
    myList.add(new RestaurantInfoBigCard(
        name: "Burger King",
        rating: 5.1,
        numOfRating: 231,
        deliveryTime: 20,
        image: null,
        foodType: ["Fastfood", "Amerikan"],
        press: null));
    myList.add(new RestaurantInfoBigCard(
        name: "Pizza Hut",
        rating: 4.5,
        numOfRating: 231,
        deliveryTime: 20,
        image: null,
        foodType: ["Fastfood", "İtalyan"],
        press: null));
    myList.add(new RestaurantInfoBigCard(
        name: "Ne Yesek Burger",
        rating: 7.2,
        numOfRating: 231,
        deliveryTime: 20,
        image: null,
        foodType: ["Fastfood", "Türk"],
        press: null));
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void showResult() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showSearchResult = true;
        _isLoading = false;
      });
    });
  }

  void buildCard() {
    RestaurantInfoBigCard(
      // Images are List<String>
      image: demoBigImages[3],
      name: "McDonald's",
      rating: 8.6,
      numOfRating: 200,
      deliveryTime: 25,
      foodType: [
        "Fast-Food",
        "Amerikan Mutfağı",
      ],
      press: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(of: 10),
            //Text('Arama', style: kH2TextStyle),
            //VerticalSpacing(),
            buildSearchForm(),
            VerticalSpacing(),
            Text(_showSearchResult ? "Arama Sonuçları" : "En iyi restoranlar",
                style: kSubHeadTextStyle),
            VerticalSpacing(),
            Expanded(
              child: ListView.builder(
                itemCount: searchList.length, //5 is demo length of your data
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding),
                  child: RestaurantInfoBigCard(
                    // Images are List<String>
                    image: demoBigImages[2],
                    name: searchList[index].name,
                    rating: searchList[index].rating,
                    numOfRating: 200,
                    deliveryTime: 25,
                    foodType: [
                      "Fast-Food",
                      "Amerikan Mutfağı",
                    ],
                    press: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form buildSearchForm() {
    return Form(
      key: _formKey,
      child: TextFormField(
        onChanged: (value) {
          // get data while typing
          if (myList
                  .where((res) {
                    return res.name.contains(value);
                  })
                  .toList()
                  .length >
              0) {
            searchList = myList.where((res) {
              return res.name.contains(value);
            }).toList();
            showResult();
          }
        },
        onFieldSubmitted: (value) {
          if (_formKey.currentState.validate()) {
            // If all data are correct then save data to out variables
            _formKey.currentState.save();

            // Once user pree on submit
            showResult();
          } else {
            // If all data are not valid then start auto validation.
            setState(() {
              _autoValidate = true;
            });
          }
        },
        validator: requiredValidator,
        autovalidate: _autoValidate,
        style: kSecondaryBodyTextStyle,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Ne Yesek?",
          contentPadding: kTextFieldPadding,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              color: kBodyTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
