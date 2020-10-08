
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Corousel()
  ),
);

class _PageSelector extends StatefulWidget {
  const _PageSelector({this.cards});

  final List<Card> cards;

  @override
  __PageSelectorState createState() => __PageSelectorState();
}

class __PageSelectorState extends State<_PageSelector> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Center(
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          height: height * 0.65,
          initialPage: 0,
          scrollPhysics: BouncingScrollPhysics(),
          autoPlay: true,
        ),
        items: widget.cards.map<Widget>((Card cards) {
          return cards;
        }).toList(),
      ),
    ));
  }
}

class Corousel extends StatelessWidget {
  static const String routeName = '/material/page-selector';

  List cardList(BuildContext context) {
    final List<Card> cards = <Card>[
      CarouselCard(imgPath: 'images/img1.jpg').build(context),
      CarouselCard(imgPath: 'images/img2.jpg').build(context),
      CarouselCard(imgPath: 'images/img3.jpg').build(context),
      CarouselCard(imgPath: 'images/img4.jpg').build(context),
      CarouselCard(imgPath: 'images/img5.jpg').build(context)
    ];
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: cardList(context).length,
        child: _PageSelector(cards: cardList(context)),
      ),
    );
  }
}

class CarouselCard extends StatelessWidget {
  final String imgPath;
  CarouselCard({this.imgPath});
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        child: Image.asset(imgPath, fit: BoxFit.fill),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}