import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  void Function()? onTap;
  final Icon icon;
  MyIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.brown[900],
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
