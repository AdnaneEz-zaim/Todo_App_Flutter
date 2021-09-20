import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget MyBoutton({ required String text,final double ?radius,double ?width,Color ?bgColor, IconData ?icon,final Function()? onPressed})=>
    Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius == null ? 0.0 : radius),
      ),
  width: width,//double.nan,

  child: MaterialButton(
    onPressed: onPressed,
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon != null ?Icon(icon,color: Colors.white,size: 25,):Container(),
        Text(text[0].toUpperCase() + text.substring(1),
            style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
        ),
      ],
    ),
  ),
);