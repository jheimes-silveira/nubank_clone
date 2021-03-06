import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubank_clone/app/core/shared/nu_icons_icons.dart';
import 'package:nubank_clone/app/core/extensions/double.dart';

class BalanceWidget extends StatelessWidget {
  final bool showInfos;
  final double balance;

  const BalanceWidget(
    this.showInfos,
    this.balance,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              NuIcons.ic_money_coins,
                              color: Colors.black.withOpacity(0.5),
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Conta',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 14,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Saldo dispon??vel',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black38,
                                fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 35,
                          width: 250,
                          child: showInfos
                              ? Text(
                                  balance.formatMoney(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              : Container(color: Colors.grey.withOpacity(.5)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
