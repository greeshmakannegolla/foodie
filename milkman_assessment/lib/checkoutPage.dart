import 'package:flutter/material.dart';
import 'package:milkman_assessment/helpers/colorConstants.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
            child: Scaffold(
                backgroundColor: ColorConstants.appBackgroundColor,
                appBar: AppBar(
                  elevation: 0,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.appBackgroundColor,
                    ),
                  ),
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: ColorConstants.textPrimaryColor,
                      ),
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14.0),
                            child: Image.asset(
                              "images/food3.jpeg",
                              height: 65,
                              width: 65,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(children: const [Text("Paradise")])
                        ],
                      )
                    ],
                  ),
                ))));
  }
}
