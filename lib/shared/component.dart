import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

Widget defaultTextField({
  required var controller,
  required var inputText,
  required var validator,
  required String label,
  var suffixIcon,
  var sufixPressed,
})=>Center(
  child: SizedBox(
    width: 300,
    child: TextFormField(
      controller: controller,
      keyboardType: inputText,
      validator: validator ,


      style: const TextStyle(
          color: Colors.black
      ),
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.white,

              )
          ),
        suffixIcon:  suffixIcon != null
            ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: defaultColor,
          ),

              child: IconButton(
              onPressed: sufixPressed,
              color:defaultColor ,
              icon: Icon(
                suffixIcon,
                color: Colors.white,
              ),

              ),
            )
            : null,
      ),
    ),
  ),
);


Widget defaultBottom({
  required var function,
  required String text
})=>Center(
  child: Container(
    width: 300,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: defaultColor,
    ),
    child: TextButton(onPressed: function, child:  Text(
      text,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 20
      ),
    )
    ),
  ),
);

void navigateTo(context,widget)=>Navigator.push(
    context,
    MaterialPageRoute(
        builder: (BuildContext context) => widget
    ),
);

Widget defaultSocialLogo({
  required String image,
   Color? color
})=>Container(
  height: 45,
  width: 100,
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white
  ),
  child:  Image(
    image: AssetImage(image),
    color: color,

  ),
);