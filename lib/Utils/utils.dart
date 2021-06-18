
import 'package:flutter/material.dart';

class Utils {
  static var primaryColor = 0xffEA7021;
  static var accentColor = 0xffF28510;


  static var backgroundColorblue = Colors.blue;
  static var backgroundColorteal = Colors.teal;
  // static var backgroundColor=Color(0xfff0e5d8);
  static var gray = 0xff777777;
  static var redColor = 0xFFFF0000;
  static var yellowColor = 0xFFD48D00;
  static var lightgrayColor = 0xffB5B5B5;
  static var blackColor = 0xff1C1C1C;

  static var bluecolor = 0xff2CA4D8;



  static getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Widget sizeBoxHeight(double height) {
    return SizedBox(
      height: height,
    );
  }
  static Widget sizeBoxWidth(double width) {
    return SizedBox(
      width: width,
    );
  }

  static Widget dataTextField(TextEditingController controller,IconData icon,String title){
    return  TextFormField(
      controller: controller,
      cursorColor: Colors.white,

      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        icon: Icon(icon, color: Colors.white70),
        hintText: title,
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
        hintStyle: TextStyle(color: Colors.white70),
      ),
    );
  }

  static Widget button(BuildContext context,Function() ontap,String title){
   return Container(
      width: Utils.getWidth(context),
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        onPressed: ontap,
        elevation: 0.0,
        color: Colors.purple,
        child: Text(title, style: TextStyle(color: Colors.white70)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

}
