import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
    final VoidCallback onTab;
    final String btnText;
  const CustomButton({super.key,required this.onTab,required this.btnText});

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        boxShadow:[ BoxShadow(color: Colors.blue,
        blurRadius: 5,
        spreadRadius: 0)
        ],
      ),

      child: ElevatedButton(onPressed: onTab,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, 50),
        backgroundColor: Colors.blue
      ),
          child: Text(btnText,style: const TextStyle(fontSize: 16),),),
    );
  }
}
