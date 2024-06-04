import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends AppBar {
  MyAppBar({Color? renk, required BuildContext context})
      : super(
          backgroundColor: renk,
          // üst sınıfın özelliklerini kullanıcaz
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              width: 50,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 36,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/cart.svg',
                  width: 36,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )),
            SizedBox(
              width: 15,
            ),
          ],
        );
}
