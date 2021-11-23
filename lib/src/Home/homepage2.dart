import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageDeteil extends StatefulWidget {
  @override
  _HomePageDeteilState createState() => _HomePageDeteilState();
}

class _HomePageDeteilState extends State<HomePageDeteil> {
  final List<String> imgList = [
    'https://cdn-cms.pgimgs.com/property-review/2019/04/onlineimageresize_com_01.jpg',
    'https://wp-assets.dotproperty-kh.com/wp-content/uploads/sites/9/2021/02/18173438/pic_1-696x407.jpg',
    'https://s3.ap-southeast-1.amazonaws.com/o77site/webproject-source/condominium/dcondo-hideaway-rangsit/img/gallery/dcondo-hideway-rangsit-condo-gallery-06.webp',
    'https://www.sansiri.com/condominium/dcondo-bliss-sriracha/img/gallery/dcondo-bliss-sriracha-gallery-1200X800-16.jpg',
    'https://www.sansiri.com/condominium/dcondo-bliss-sriracha/img/gallery/dcondo-bliss-sriracha-gallery-1200X800-15.jpg',
    'https://www.sansiri.com/condominium/dcondo-bliss-sriracha/img/gallery/dcondo-bliss-sriracha-gallery-1200X800-01.jpg',
    'https://s3.ap-southeast-1.amazonaws.com/o77site/webproject-source/condominium/dcondo-hideaway-rangsit/img/gallery/dcondo-hideway-rangsit-condo-gallery-02.webp'
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image: AssetImage("assets/images/"))),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 20,
                  ),
                ),
                Text("ยินดีต้อนรับ",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1,
                    )),
                Text(
                  "หาที่พักสำหรับคุณ ในจังหวัดปัตตานี",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                CarouselSlider.builder(
                  itemCount: imgList.length,
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  itemBuilder: (context, index, realIdx) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        child: Center(
                            child: Image.network(imgList[index],
                                fit: BoxFit.cover, width: 1000)),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Accommonition Type",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: <Widget>[
                      CategoryCard(
                          title: "Condominium",
                          imagesSrc:
                              "assets/images/condoes.png"),
                      CategoryCard(
                          title: "Apartment",
                          imagesSrc:
                              "assets/images/apares.png"),
                      CategoryCard(
                          title: "Mansion",
                          imagesSrc:
                              "assets/images/manes.png"),
                      CategoryCard(
                          title: "Dormitory",
                          imagesSrc: "assets/images/diries.png"),
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imagesSrc;
  final String title;
  const CategoryCard({
    Key key,
    this.title,
    this.imagesSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        //padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
            )
          ],
        ),
        child: Material(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(imagesSrc),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
