import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/wishlist_card.dart';

import '../../providers/page_provider.dart';
// ignore_for_file: prefer_const_constructors

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlisProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget header() {
      return AppBar(
        title: Text('Favorite Shoes'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
      );
    }

    Widget empetyWishlist() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_love.png',
              width: 74,
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              ' You don\'t have dream shoes?',
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
            SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: () {
                  pageProvider.currentIndex = 0;
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
      ));
    }

    Widget conten() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            children: wishlisProvider.wishlist
                .map(
                  (product) => WishlistCard(product),
                )
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        //empetyWishlist(),
        //conten(),
        wishlisProvider.wishlist.length == 0 ? empetyWishlist() : conten(),
      ],
    );
  }
}
