import 'package:flutter/material.dart';
import 'package:payment_apps/theme.dart';

void main() {
  runApp(PaymentApps());
}

class PaymentApps extends StatefulWidget {
  @override
  State<PaymentApps> createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subTitle, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedIndex == index
                  ? Color(0xff007dff)
                  : Color(0xff4d5b7c),
            ),
            borderRadius: BorderRadius.circular(
              14,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/images/bluecircle1.png',
                          height: 18,
                          width: 18,
                          color: Color(0xff007dff),
                        )
                      : Image.asset(
                          'assets/images/bluecircle2.png',
                          height: 18,
                          width: 18,
                          color: Color(0xff4d5b7c),
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: planTextStyle,
                      ),
                      Text(
                        subTitle,
                        style: descTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 140,
                  ),
                  Text(
                    pricing,
                    style: priceTextStyle,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 32,
          right: 32,
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/growth.jpg',
                width: 267,
                height: 200,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Upgrade To',
                  style: titleTextStyle,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Pro',
                  style: titleProTextStyle,
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
            Text(
              'Go unlock all features and \nbuild your own business bigger',
              style: subTilteTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51.23,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff007dff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(71),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Checkout Now',
                style: buttonTextStyle,
              ),
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff04112f),
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              SizedBox(height: 50),
              option(0, 'Monthly', 'Good for starting up', '\$20'),
              option(1, 'Quarterly', 'Focusing on building', '\$55'),
              option(2, 'Yearly', 'Steady company', '\$220'),
              SizedBox(height: 50),
              selectedIndex == -1 ? SizedBox() : checkoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
