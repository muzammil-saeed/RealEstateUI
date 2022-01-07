import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:realestateapp/custom/borderbox.dart';
import 'package:realestateapp/custom/optionbutton.dart';
import 'package:realestateapp/utils/constants.dart';
import 'package:realestateapp/utils/custom_functions.dart';
import 'package:realestateapp/utils/widget_functions.dart';

class DetailPage extends StatelessWidget {
  final dynamic detailItem;

  const DetailPage({Key? key, @required this.detailItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidepadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        backgroundColor: COLOR_WHITE,
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(detailItem["image"]),
                        Positioned(
                          width: size.width,
                          top: padding,
                          child: Padding(
                            padding: sidepadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: const BorderBox(
                                    heigth: 50,
                                    width: 50,
                                    child: Icon(
                                      Icons.keyboard_backspace,
                                      color: COLOR_BLACK,
                                    ),
                                  ),
                                ),
                                const BorderBox(
                                  heigth: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: COLOR_BLACK,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidepadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${formatCurrency(detailItem["amount"])}",
                                style: themeData.textTheme.headline1,
                              ),
                              addVerticalSpace(5),
                              Text(
                                "\$${detailItem["address"]}",
                                style: themeData.textTheme.subtitle2,
                              ),
                            ],
                          ),
                          BorderBox(
                            child: Text(
                              "20 Hours ago",
                              style: themeData.textTheme.headline5,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                          )
                        ],
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidepadding,
                      child: Text(
                        "House Information",
                        style: themeData.textTheme.headline4,
                      ),
                    ),
                    addVerticalSpace(padding),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(children: [
                        InformationTile(
                          content: "${detailItem["area"]}",
                          name: "Square Foot",
                        ),
                        InformationTile(
                          content: "${detailItem["bedrooms"]}",
                          name: "Bedrooms",
                        ),
                        InformationTile(
                          content: "${detailItem["bathrooms"]}",
                          name: "Bathrooms",
                        ),
                        InformationTile(
                          content: "${detailItem["garage"]}",
                          name: "Garage",
                        ),
                      ]),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidepadding,
                      child: Text(
                        detailItem["description"],
                        textAlign: TextAlign.justify,
                        style: themeData.textTheme.bodyText2,
                      ),
                    ),
                    addVerticalSpace(100),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionButton(
                      text: "Message",
                      icon: Icons.message,
                      width: size.width * 0.35,
                    ),
                    addHorizontalSpace(10),
                    OptionButton(
                      text: "Call",
                      icon: Icons.call,
                      width: size.width * 0.35,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationTile extends StatelessWidget {
  final String? content;
  final String? name;

  const InformationTile({Key? key, this.content, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final double tilesize = size.width * 0.20;
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BorderBox(
            width: tilesize,
            heigth: tilesize,
            child: Text(
              content.toString(),
              style: themeData.textTheme.headline3,
            ),
          ),
          addVerticalSpace(15),
          Text(
            name.toString(),
            style: themeData.textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
