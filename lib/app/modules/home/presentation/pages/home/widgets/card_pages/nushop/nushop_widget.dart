import 'package:flutter/material.dart';
import 'package:nubank_clone/app/core/shared/nu_icons_icons.dart';

class NuShopWidget extends StatelessWidget {
  final Function onNuShop;
  
  const NuShopWidget(this.onNuShop);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNuShop,
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        height: 40,
                        width: 40,
                        child: Icon(
                          NuIcons.store,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Nu',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Shop',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 20),
                    width: double.maxFinite,
                    child: Text(
                      'NuConta Marketplace, produtos incríveis',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
