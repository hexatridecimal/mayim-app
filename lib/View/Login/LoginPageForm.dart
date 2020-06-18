import 'package:flutter/material.dart';
import 'package:mayim/bloc/login_bloc.dart';
import 'package:provider/provider.dart';

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({Key key}) : super(key: key);
  @override
  _LoginPageFormState createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  void initState() { 
    super.initState();
    final state = context.read<LoginState>();
    if (state is LoginFailure) {
      emailController.text = state.email;
    }  
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LoginFormTextFields(
            emailController: emailController,
            passwordController: passwordController),
        LoginFormButton(
          emailController: emailController,
          passwordController: passwordController,
        )
      ],
    );
  }
}

class LoginFormTextFields extends StatelessWidget {
  const LoginFormTextFields({
    Key key,
    @required this.emailController,
    @required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  String _errorText(BuildContext context) {
    final state = context.watch<LoginState>();
    if (state is LoginFailure) {
      return state.error;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          LoginFormTextField(
            controller: emailController,
            icon: Icons.email,
            hintText: "Email",
          ),
          SizedBox(height: 30.0),
          LoginFormTextField(
            controller: passwordController,
            icon: Icons.lock,
            hintText: "Password",
            obscureText: true,
            errorText: _errorText(context),
          ),
        ],
      ),
    );
  }
}

class LoginFormTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final IconData icon;
  final bool obscureText;

  const LoginFormTextField(
      {Key key,
      this.controller,
      this.hintText,
      this.errorText,
      this.icon,
      this.obscureText = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
          icon: Icon(icon, color: Colors.white70),
          hintText: hintText,
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white70)),
          hintStyle: TextStyle(color: Colors.white70),
          errorText: errorText,
          errorStyle: TextStyle(color: Colors.white54, fontSize: 16.0)),
    );
  }
}

class LoginFormButton extends StatelessWidget {
  const LoginFormButton({
    Key key,
    @required this.emailController,
    @required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        onPressed: () {
          // ignore: close_sinks
          final bloc = context.read<LoginBloc>();
          bloc.add(LoginButtonPressed(
              email: emailController.text, password: passwordController.text));
        },
        elevation: 0.0,
        color: Colors.purple,
        child: Text("Sign In", style: TextStyle(color: Colors.white70)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
