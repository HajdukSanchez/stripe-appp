import 'package:flutter/material.dart';

import 'package:stripe_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
                width: size.width, height: size.height, top: 200, child: const CreditCardList()),
            Positioned(
                bottom: 0,
                child: TotalPayButton(
                  width: size.width,
                ))
          ],
        ));
  }
}
