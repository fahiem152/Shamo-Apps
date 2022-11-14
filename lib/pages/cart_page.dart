import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/cart_provider.dart';

import 'package:shamo/theme.dart';
import 'package:shamo/widgets/cart_card.dart';

// ignore_for_file: prefer_const_constructors
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        elevation: 0,
        title: Text('Your Cart'),
      );
    }

    Widget empetyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_keranjang.png',
              width: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Opss! Your Cart is Empty',
              style: primaryTextstyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: secondaryTextStyle,
            ),
            Container(
              width: 152,
              height: 44,
              margin: EdgeInsets.only(top: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: Text(
                  'Explore Store',
                  style: primaryTextstyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget conten() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: cartProvider.carts
            .map(
              (cart) => CartCard(cart),
            )
            .toList(),
        //CartCard(),
      );
    }

    Widget customBottomNav() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        height: 180,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextstyle,
                  ),
                  Text(
                    '\$${cartProvider.totalPrice()}',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Divider(
              color: subtitleColor,
              thickness: 0.3,
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Container(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: primaryTextstyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryTextColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: cartProvider.carts.length == 0 ? empetyCart() : conten(),
      bottomNavigationBar:
          cartProvider.carts.length == 0 ? SizedBox() : customBottomNav(),
    );
  }
}
