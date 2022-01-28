import 'package:flutter/material.dart';
import 'package:milkman_assessment/helpers/colorConstants.dart';
import 'package:milkman_assessment/helpers/styleConstants.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "images/veg.png",
                  height: 20,
                  width: 25,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "Veg Biryani",
                  style: kHeader.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "₹300",
                  style: kHeader.copyWith(
                      fontSize: 16,
                      color: ColorConstants.secondaryTextColor.withOpacity(0.9),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 7,
                ),
                Text("Made with indian spices, fresh veggies and lots of love",
                    style: kHeader.copyWith(
                        fontSize: 14,
                        color:
                            ColorConstants.secondaryTextColor.withOpacity(0.9),
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 17,
                ),
                Divider(
                  color: ColorConstants.secondaryTextColor.withOpacity(0.3),
                  thickness: 0.5,
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              "images/food2.jpeg",
              height: 140,
              width: 140,
            ),
          )
        ],
      ),
    );
  }
}
