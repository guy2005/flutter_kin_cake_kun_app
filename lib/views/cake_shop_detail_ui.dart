import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun_app/modle/cake_shoh.dart';

class CakeShopDetailUi extends StatefulWidget {
  CakeShop? cakeShop;

  CakeShopDetailUi({super.key, this.cakeShop});
  

  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.cakeShop!.name!,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}