import 'package:asro_store/core/style/images/app_image.dart';
import 'package:flutter/material.dart';

class noNetworkScreen extends StatelessWidget {
  const noNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageLinks.noNetworkImage),
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}
