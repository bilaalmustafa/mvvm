import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onTap});
  final String title;
  final bool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.amber),
        child: loading
            ? const CircularProgressIndicator(
                color: Colors.black,
              )
            : Text(
                title,
                style:const TextStyle(color: Colors.black, fontSize: 20),
              ),
      ),
    );
  }
}
