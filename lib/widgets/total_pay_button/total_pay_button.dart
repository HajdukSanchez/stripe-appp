import 'dart:io';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TotalPayButton extends StatelessWidget {
  final double width;

  const TotalPayButton({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Total",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "250.55 USD",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          const _ButtonPay(),
        ],
      ),
    );
  }
}

class _ButtonPay extends StatelessWidget {
  const _ButtonPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      elevation: 0,
      color: Colors.black,
      shape: const StadiumBorder(),
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            !true
                ? FontAwesomeIcons.solidCreditCard
                : Platform.isAndroid
                    ? FontAwesomeIcons.google
                    : FontAwesomeIcons.apple,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          const Text(
            "Pay",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
