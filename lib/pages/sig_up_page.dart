import 'package:controller_training/model/user_model.dart';
import 'package:controller_training/service/user_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static final String id = "sign_up_page";
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final c_passwordController = TextEditingController();

  void _create(){
    String name = nameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone  =phoneController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String c_password = c_passwordController.text.toString().trim();

    User user = User(name: name, email: email, phone: phone, password: password, c_password: c_password);

    Prefs.storeUser(user);

    Prefs.loadUser().then((user) => {
      print(user.name),
      print(user.email),
      print(user.phone),
      print(user.password),
      print(user.c_password),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80,),
              //Let's
              Container(
                child: Center(
                  child: Text("Let's Get Started!", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 10,),
              //text
              Container(
                child: Center(
                  child: Text("Create an account to Q Allure to get all features", style: TextStyle(fontSize: 16, color: Colors.grey),),
                ),
              ),
              SizedBox(height: 50,),
              //Name
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Color.fromRGBO(200, 200, 200, 0.4), blurRadius: 20, offset: Offset(0,10)),
                  ],
                ),
                child: Center(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Name",
                      border: InputBorder.none,
                      icon: Icon(Icons.person_outline, color: Colors.blue,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //Email
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Color.fromRGBO(200, 200, 200, 0.4), blurRadius: 20, offset: Offset(0,10)),
                  ],
                ),
                child: Center(
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: InputBorder.none,
                      icon: Icon(Icons.email_outlined),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //Phone
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Color.fromRGBO(200, 200, 200, 0.4), blurRadius: 20, offset: Offset(0,10)),
                  ],
                ),
                child: Center(
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "Phone",
                      border: InputBorder.none,
                      icon: Icon(Icons.phone_iphone_outlined),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //Password
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Color.fromRGBO(200, 200, 200, 0.4), blurRadius: 20, offset: Offset(0,10)),
                  ],
                ),
                child: Center(
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      icon: Icon(Icons.lock_open),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //Confirm password
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Color.fromRGBO(200, 200, 200, 0.4), blurRadius: 20, offset: Offset(0,10)),
                  ],
                ),
                child: Center(
                  child: TextField(
                    controller: c_passwordController,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: InputBorder.none,
                      icon: Icon(Icons.lock_open),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              //create
              Container(
                height: 50,
                width: 220,
                // margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(color: Color.fromRGBO(30, 130, 230, 0.4), blurRadius: 20, offset: Offset(0,10)),
                  ]
                ),
                child: FlatButton(
                  child: Text("CREATE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  onPressed: _create,
                ),
              ),
              SizedBox(height: 30,),
              //last column
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    child: Center(
                      child: Text("Already have an account?", style: TextStyle(fontSize: 16),),
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    child: Container(
                      child: Text("Login here", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, "log_in_page");
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
