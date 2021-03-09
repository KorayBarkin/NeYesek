import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui_kit/components/cards/big/restaurant_info_big_card.dart';
import 'package:food_ui_kit/components/scalton/big_card_scalton.dart';
import 'package:food_ui_kit/constants.dart';
import 'package:food_ui_kit/size_config.dart';
import '../../../demoData.dart';
import '../../../dummy.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  List<RestaurantInfoBigCard> myList;
  List<RestaurantInfoBigCard> searchList;

  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _showSearchResult = false;
  bool _isLoading = true;

  List<String> burger = [
    "assets/images/cheeseburger.jpg",
  ];
  List<String> pizza = [
    "assets/images/pizza.jpg",
  ];

  @override
  void initState() {
    super.initState();
    myList = new List<RestaurantInfoBigCard>();
    searchList = new List<RestaurantInfoBigCard>();
    searchList.add(new RestaurantInfoBigCard(
        name: "Burger",
        rating: 7.2,
        numOfRating: 231,
        deliveryTime: 20,
        price: 36.0,
        images: burger,
        foodType: ["Fastfood", "Türk"],
        press: null));
    searchList.add(new RestaurantInfoBigCard(
        name: "Karışık Pizza",
        rating: 4.5,
        numOfRating: 231,
        deliveryTime: 20,
        price: 22.0,
        images: pizza,
        foodType: ["Fastfood", "İtalyan"],
        press: null));
    searchList.add(new RestaurantInfoBigCard(
        name: "Cheese Burger",
        rating: 5.1,
        numOfRating: 231,
        deliveryTime: 20,
        price: 27.5,
        images: burger,
        foodType: ["Fastfood", "Amerikan"],
        press: null));
    searchList.add(new RestaurantInfoBigCard(
        name: "Margarita Pizza",
        rating: 9.4,
        numOfRating: 231,
        deliveryTime: 20,
        price: 42.0,
        images: pizza,
        foodType: ["Fastfood", "Türk"],
        press: null));
    myList.add(new RestaurantInfoBigCard(
        name: "Margarita Pizza",
        rating: 9.4,
        numOfRating: 231,
        deliveryTime: 20,
        images: pizza,
        price: 42.0,
        foodType: ["Fastfood", "Türk"],
        press: null));
    myList.add(new RestaurantInfoBigCard(
        name: "Burger",
        rating: 7.2,
        numOfRating: 231,
        deliveryTime: 20,
        images: burger,
        foodType: ["Fastfood", "Türk"],
        price: 36.0,
        press: null));
    myList.add(new RestaurantInfoBigCard(
        name: "Cheese Burger",
        rating: 5.1,
        numOfRating: 231,
        deliveryTime: 20,
        images: burger,
        price: 27.5,
        foodType: ["Fastfood", "Amerikan"],
        press: null));
    myList.add(new RestaurantInfoBigCard(
        name: "Karışık Pizza",
        rating: 4.5,
        numOfRating: 231,
        deliveryTime: 20,
        images: pizza,
        price: 22.0,
        foodType: ["Fastfood", "İtalyan"],
        press: null));

    print("myList initialized");
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    filter();
    print(ranges[0]);
    print(ranges[1]);
    print(ranges[2]);
    print(ranges[3]);
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
      images: null,
      name: "McDonald's",
      rating: 8.6,
      numOfRating: 200,
      price: 48.0,
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
                    images: demoBigImages..shuffle(),
                    name: searchList[index].name,
                    rating: searchList[index].rating,
                    numOfRating: 200,
                    deliveryTime: searchList[index].deliveryTime,
                    price: searchList[index].price,
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

  void filter() {
    List<RestaurantInfoBigCard> ratingList = new List<RestaurantInfoBigCard>();
    List<RestaurantInfoBigCard> priceList = new List<RestaurantInfoBigCard>();
    // rating
    if (filter_types[0]) {
      searchList = [];
      if (myList
              .where((element) {
                return element.rating >= ranges[0] &&
                    element.rating <= ranges[1];
              })
              .toList()
              .length >
          0) {
        print("length > 0");

        ratingList = myList.where((element) {
          return element.rating >= ranges[0] && element.rating <= ranges[1];
        }).toList();
        print(ratingList.length);
        //searchList += ratingList;
      }
    }

    //price
    if (filter_types[1]) {
      if (ratingList
              .where((element) {
                return element.price >= ranges[2] && element.price <= ranges[3];
              })
              .toList()
              .length >
          0) {
        print("length > 0");

        priceList = ratingList.where((element) {
          return element.price >= ranges[2] && element.price <= ranges[3];
        }).toList();
        print(ranges[2]);
        ratingList.removeWhere((item) => !priceList.contains(item));
        print(priceList.length);
        searchList = ratingList;
      }
    }
    filter_types[0] = false;
    filter_types[1] = false;
    showResult();
  }

  void filterRating(double start, double end) {
    if (myList
            .where((element) {
              return element.rating >= start && element.rating <= end;
            })
            .toList()
            .length >
        0) {
      print("length > 0");

      searchList.removeWhere((item) => !myList
          .where((element) {
            return element.rating >= start && element.rating <= end;
          })
          .toList()
          .contains(item));
      showResult();
    }
  }

  void filterPrice(double start, double end) {
    if (searchList
            .where((element) {
              return element.price >= start && element.price <= end;
            })
            .toList()
            .length >
        0) {
      print("length > 0");
      searchList += searchList.where((element) {
        return element.price >= start && element.price <= end;
      }).toList();
      showResult();
    }
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
