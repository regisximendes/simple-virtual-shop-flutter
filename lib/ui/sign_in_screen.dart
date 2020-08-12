import 'package:flutter/material.dart';
import 'package:loja_virtual/ui/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _globalKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        actions: [
          FlatButton(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpScreen()));

          }, child:  Text("Create account", style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Form(
        key: _globalKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "E-maail",
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if(email.isEmpty || !email.contains("@")) {
                    return "invalid email";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                obscureText: true,
                validator: (password) {
                  if(password.isEmpty || password.length < 6) {
                    return "invalid password";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                    onPressed: (){},
                    child: Text("Forgot password"),
                  padding: EdgeInsets.zero,
                )
              ),
              SizedBox(height: 16),
              SizedBox(
                  height: 44,
                child: RaisedButton(
                    onPressed: (){
                      if(_globalKey.currentState.validate()){

                      }
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 20)
                    )
                ),
              ),
            ],
      )),
    );
  }
}
