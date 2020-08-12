import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _globalKey = GlobalKey<FormState>();

      return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Form(
          key: _globalKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                keyboardType: TextInputType.text,
                validator: (name) {
                  if(name.isEmpty ) {
                    return "invalid name";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "E-mail",
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
