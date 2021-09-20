import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// var emailController =TextEditingController();
Widget MyTextField(var emailController,var keyboardType,String labelText,
    IconData prefixIcon,final Function()? function) => Container(
//TextInputType.emailAddress
        child: TextFormField(
          //hadi dyal l password
          //obscureText: obscureText,
          cursorColor: Colors.pink,
          controller: emailController,
          keyboardType:keyboardType,
          validator: (value){
            if(value!.isEmpty){
              return "il faut rempliare ce champs";
            }
            return null;
          },

          onTap: function,
          decoration: InputDecoration(
              labelText: labelText,
              prefixIcon:  Icon(prefixIcon),
              // suffixIcon:  const Icon(Icons.remove_red_eye),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: Colors.pink,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.redAccent,
              ),
            ),
            focusedErrorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.pink,
              ),
            ),
          ),

        ),
    );