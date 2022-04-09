// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant.dart';
import 'package:shop/model/products_model/products_model.dart';
import 'package:shop/provider/cart_provider/cart_provider.dart';
import 'package:shop/provider/detail_provider/detail_provider.dart';
import '../small_button/small_button.dart';

class AddRemoveProductsButtonCart extends StatelessWidget {
  AddRemoveProductsButtonCart({Key? key, required this.productsModel})
      : super(key: key);
  ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    final detailProvider = Provider.of<DetailProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          SmallButton(
            iconData: Icons.remove,
            onTap: () {
              //   cartProvider.removeOneProductsCart(productsModel);
            },
            color: grey,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                cartProvider.countAddCart.toString(),
              )),
          SmallButton(
            iconData: Icons.add,
            onTap: () {
              cartProvider.addProductsCart(productsModel);
            },
            color: grey,
          ),
          const Spacer(),
          SmallButton(color: kred, iconData: Icons.delete, onTap: () {})
        ],
      ),
    );
  }
}
