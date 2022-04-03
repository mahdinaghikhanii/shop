import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/model/products_model.dart';
import 'package:shop/provider/products_provider/products_provider.dart';
import 'package:shop/theme/constant.dart';

class CartItems extends StatelessWidget {
  CartItems({Key? key, l}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ProductsProvider>(builder: (context, cart,child){
      return 
      SizedBox( width: size.width,
    height:  size.height * 0.20,child:ListView.builder(
      itemCount: cart.cartlist,
      itemBuilder: (BuildContext context, int index) { 
        return Row(
        children: [
          Container(
            height: 80,
            width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Constans.smallBorderRadios)),
            child: Hero(
              tag:  
              child: CachedNetworkImage(imageUrl: ),
            ),
          )
        ],
      );
       },
    
      ));

    }
    );
}

