import 'package:flutter/material.dart';

Widget defaultSearchField({
  required TextEditingController controller,
  required TextInputType type,
  var onsubmit,
  var onChange,
  var onTap,
  String? hintText,
  var prefixIconTapFunction,
  required var validator,
  String? label,
  required IconData prefixIcon,
  var suffixIcon,
  bool isPassword = false,
  var sufixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,
      style: const TextStyle(
        color: Colors.white,
      ),

      decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.black
          ),
          labelStyle: const TextStyle(
              color: Colors.white
          ),
          prefixIcon: InkWell(
            onTap: prefixIconTapFunction,
            child: Icon(
              prefixIcon,
              color: Colors.white,
            ),
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
              onPressed: sufixPressed,
              icon: Icon(
                suffixIcon,
              ))
              : null,

          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.grey,

              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.grey  ,

              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.white,

              )
          )
      ),
    );