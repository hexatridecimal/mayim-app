import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:mayim/Settings.dart';
import 'package:mayim/Utils/ResponseClass.dart';
import 'package:mayim/Utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Utils.getHeight(context),
        width: Utils.getWidth(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Utils.backgroundColorblue, Utils.backgroundColorteal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              headerSection(),
              textSection(),
              buttonSection(),
            ],
          ),
        ),
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Mayim Chat",
          style: TextStyle(
              color: Colors.white70,
              fontSize: 40.0,
              fontWeight: FontWeight.bold)),
    );
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();
  final TextEditingController aboutController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          Utils.dataTextField(
              nameController, Icons.drive_file_rename_outline, 'Name'),
          SizedBox(height: 30.0),
          Utils.dataTextField(emailController, Icons.email, 'Email'),
          SizedBox(height: 30.0),
          Utils.dataTextField(aboutController, Icons.account_box_outlined, 'About'),
          SizedBox(height: 30.0),
          Utils.dataTextField(passwordController, Icons.lock, 'Password'),
          SizedBox(height: 30.0),
          Utils.dataTextField(
              confirmPasswordController, Icons.lock, 'Confirm Password'),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Container buttonSection() {
    return Utils.button(
        context,
        nameController.text == '' ||
                emailController.text == '' ||
                aboutController.text == '' ||
            passwordController.text == ''||
            confirmPasswordController.text == ''||
                passwordController.text.length < 6 ||
                confirmPasswordController.text.length < 6 ||
                passwordController.text != confirmPasswordController.text
            ? null
            : () {
          var jsonData = {
            "user[email]":emailController.text.toString(),
            "user[name]":nameController.text.toString(),
            "user[password]" : passwordController.text.toString(),
            "user[password_confirmation]":confirmPasswordController.text.toString(),
            "user[bio]":aboutController.text.toString()
          };
          signup(jsonData,APP_SERVER + '/signup' ,context);
        },
        'Sign Up');
  }
  signup(Map<String,dynamic> jsonData,String api,context) async{
    Response response =  await ResponseClass.callPostApi(jsonData, api, context);
    // print(api);
    print(response.body);
    if(response.statusCode == 200){
      Fluttertoast.showToast(msg: 'Sign Up Successfully',backgroundColor: Colors.black,toastLength: Toast.LENGTH_LONG);
      _launchUrl();
    }else{
      Fluttertoast.showToast(msg: 'Fill up detail is already register',backgroundColor: Colors.black,toastLength: Toast.LENGTH_LONG);

    }
  }

  void _launchUrl() async{
    await  canLaunch(APP_SERVER) ? await launch(APP_SERVER) : throw 'Could not launch ${APP_SERVER}';
  }
}
