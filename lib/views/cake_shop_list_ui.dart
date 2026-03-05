import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_kin_cake_kun_app/modle/cake_shoh.dart';
import 'package:flutter_kin_cake_kun_app/views/cake_shop_detail_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CakeShopListUi extends StatefulWidget {
  const CakeShopListUi({super.key});

  @override
  State<CakeShopListUi> createState() => _CakeShopListUiState();
}

class _CakeShopListUiState extends State<CakeShopListUi> {
  List<String> imgCakeShop = [
    'assets/images/ck01.png',
    'assets/images/ck02.png',
    'assets/images/ck03.png',
    'assets/images/ck04.png',
    'assets/images/ck05.png',
    'assets/images/ck06.png',
    'assets/images/ck07.png',
  ];

  List<CakeShop> cakeShops = [
    CakeShop(
      name: 'Yellow Spoon Pastry',
      address: 'โครงการเอกมัย คอมเพล็กซ์ (ระหว่างเอกมัย 19 และ 21)',
      phone: '0854822842',
      image1: 's11.jpg',
      image2: 's12.jpg',
      image3: 's13.jpg',
      description: 'คาเฟ่ขนมหวานที่มีเบเกอรี่โฮมเมดสูตรน้ำตาลน้อย...',
      openCloseTime: 'ทุกวัน 10.00-20.00 น.',
      website: 'https://www.yellowspoonpastry.com/',
      facebook: 'https://www.facebook.com/yspastry',
      latitude: '13.736634',
      longitude: '100.587512',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'ร้านเค้ก',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: imgCakeShop.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(imgCakeShop[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                viewportFraction: 0.8,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: cakeShops.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.red[300],
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CakeShopDetailUi(
                            cakeShop: cakeShops[index],
                          ),
                        ),
                      );
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/images/${cakeShops[index].image1}',
                        width: 70,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      cakeShops[index].name!,
                    ),
                    subtitle: Text(
                      cakeShops[index].phone!,
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.angleRight,
                      color: Colors.red[500],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}