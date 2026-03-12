import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun_app/modle/cake_shoh.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CakeShopDetailUi extends StatefulWidget {
  CakeShop? cakeShop;

  CakeShopDetailUi({super.key, this.cakeShop});

  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  // ฟังก์ชันโทรศัพท์
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    await launchUrl(launchUri);
  }

  // ฟังก์ชันเปิดเว็บ
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.cakeShop!.name!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                // รูปร้านหลัก
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/images/${widget.cakeShop!.image1!}',
                    width: 120,
                    height: 85,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 20),

                // รูปรอง
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/${widget.cakeShop!.image2!}',
                        width: 120,
                        height: 85,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/${widget.cakeShop!.image3!}',
                        width: 120,
                        height: 85,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ชื่อร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.name!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // รายละเอียดร้าน
                Text(
                  widget.cakeShop!.description!,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),

                const SizedBox(height: 15),

                // เวลาเปิดปิด
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เวลาเปิดปิด',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.openCloseTime!,
                  ),
                ),

                const SizedBox(height: 15),

                // ที่อยู่ร้าน
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ที่อยู่ร้าน',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.address!,
                  ),
                ),

                const SizedBox(height: 15),

                // ปุ่มโทร
                ElevatedButton.icon(
                  onPressed: () {
                    makePhoneCall(widget.cakeShop!.phone!);
                  },
                  icon: const Icon(Icons.phone, color: Colors.white),
                  label: Text(
                    widget.cakeShop!.phone!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // เว็บไซต์
                ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.cakeShop!.website!),
                    );
                  },
                  leading: const Icon(
                    FontAwesomeIcons.globe,
                    color: Colors.pink,
                    size: 40,
                  ),
                  title: Text(
                    widget.cakeShop!.website!,
                    style: const TextStyle(color: Colors.pink),
                  ),
                  trailing: const Icon(
                    FontAwesomeIcons.link,
                    color: Colors.pink,
                  ),
                ),

                const SizedBox(height: 10),

                // Facebook
                ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.cakeShop!.facebook!),
                    );
                  },
                  leading: const Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                    size: 40,
                  ),
                  title: Text(
                    widget.cakeShop!.facebook!,
                    style: const TextStyle(color: Colors.blue),
                  ),
                  trailing: const Icon(
                    FontAwesomeIcons.link,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  child: FlutterMap(
                    //กำหนดตำแหน่งของแผนที่
                    options: MapOptions(
                      initialCenter: LatLng(
                        double.parse(widget.cakeShop!.latitude!),
                        double.parse(widget.cakeShop!.longitude!),
                      ),
                      initialZoom: 15.0,
                    ),
                    //วาดแผนที่
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.google.com/vt/lyrs=m,h&x={x}&y={y}&z={z}&hl=ar-MA&gl=MA',
                        subdomains: const ['mt0', 'mt1', 'mt2', 'mt3'],
                        userAgentPackageName: 'com.example.app',
                      ),
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () {
                              launchUrl(
                                Uri.parse(
                                    'https://openstreetmap.org/copyright'),
                              );
                            },
                          ),
                        ],
                      ),
                      //วาดพิกัดตำเเหน่ง
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              double.parse(widget.cakeShop!.latitude!),
                              double.parse(widget.cakeShop!.longitude!),
                            ),
                            child: InkWell(
                              onTap: () {
                                //เปิด Google Maps ด้วยพิกัดที่กำหนด
                                String googleMapsUrl =
                                    'https://www.google.com/maps/search/?api=1&query=${widget.cakeShop!.latitude!},${widget.cakeShop!.longitude!}';
                                _launchInBrowser(Uri.parse(googleMapsUrl));
                              },
                              child: Icon(
                                // FontAwesomeIcons.locationArrow,
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
