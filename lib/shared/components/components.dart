import 'package:flutter/material.dart';
Widget defaultFormField (
{

   Function(String?)? onChanged,
  required TextEditingController controller,
  bool obscureText=false,
  IconData? suffixIcon,
  // required String? Function(String?)? validate,
  required IconData? prefixIcon,
  required String labelText,
  required bool validation ,
  String? alertText='Field is required',
  var suffixClick,
  String? hitText,
  String? errorText,
  double width=double.infinity,
  TextInputType? keyBoardType,
}

){
  return
  Container(
    width: width ,
    child: TextFormField(
style: TextStyle(
  fontSize: 14,
),
    onChanged: onChanged,
keyboardType: keyBoardType,
controller: controller,
obscureText: obscureText,
decoration: InputDecoration(
    hintText:hitText ,
errorText: errorText,
border: OutlineInputBorder(),
prefixIcon: Icon(prefixIcon),
labelText: labelText,
    suffixIcon: suffixIcon !=null ? IconButton(onPressed: suffixClick, icon: Icon(suffixIcon)):null,
),
validator: (value){
      if (validation){

        if(value==null||value.isEmpty){
          return alertText;
        }
        return null;
      }
},

),
  );
}




Widget materialbutton(
{
  required String text,
  required Color buttonColor,
  double width = double.infinity,
  double height = 40.0,
  Color textColor = Colors.white,
  required Function() function,
}
){
  return Container(
    width: width,
    child: MaterialButton(
      onPressed: function,
      color: buttonColor,
      height: height,
      child: Text(
        text,
        style: TextStyle(
          color:textColor,
        ),
      ),
    ),
  );
}

Widget textbutton({
  required String text,
  required String coloredText,
Color coloredTextColor=Colors.blue,
  Color textColor=Colors.black,
  required Function() function,
}
    ){
  return Row(
    children: [
      Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
      TextButton(onPressed: function, child: Text(
        coloredText,
        style: TextStyle(
          color: coloredTextColor,
        ),
      ))
    ],
  );
}
