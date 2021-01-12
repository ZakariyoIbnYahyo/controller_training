import 'package:controller_training/model/user_model.dart';
import 'package:controller_training/service/user_service.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  static final String id  = "log_in_page";
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final nameController = TextEditingController();
  final passwordController  =TextEditingController();

  void _create(){
    String name = nameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = User.from(name: name, password: password);
    Prefs.storeUser(user);

    Prefs.loadUser().then((user) => {
      print(user.name),
      print(user.password),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              //image
              Container(
                height: 120,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/login.JPG"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(height: 5,),
              //text
              Text("Welcome back!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              //text
              Text("Log in to your existant account of Q Ailure", style: TextStyle(color: Colors.grey[600]),),
              SizedBox(height: 20,),
              //login
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.only(left: 25,right: 25),
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Color.fromRGBO(200, 200, 200, 0.4), blurRadius: 20, offset: Offset(0,10)),
                      ]
                  ),
                  child: Center(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Log In",
                        border: InputBorder.none,
                        icon: Icon(Icons.person, color: Colors.blue,),
                      ),
                    ),
                  )
              ),
              SizedBox(height: 20,),
              //password
              Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  padding: EdgeInsets.only(left: 25,right: 25),
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Color.fromRGBO(200, 200, 200, 0.4), blurRadius: 20, offset: Offset(0,10)),
                      ]
                  ),
                  child: Center(
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        icon: Icon(Icons.lock, color: Colors.grey,),
                      ),
                    ),
                  )
              ),
              SizedBox(height: 10,),
              //Text
              Container(
                padding: EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password?")
                  ],
                ),
              ),
              SizedBox(height: 20,),
              //Login button
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(color: Color.fromRGBO(30, 120, 200, 0.4), blurRadius: 10, offset: Offset(0,10)),
                    ]
                ),
                child: FlatButton(
                    onPressed: _create,
                    child: Text("LOG IN", style: TextStyle(color: Colors.white),)
                ),
              ),
              SizedBox(height: 30,),
              //text
              Text("Or connect using", style: TextStyle(color: Colors.grey),),
              SizedBox(height: 15,),
              //facebook and google
              Row(
                children: [
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 60),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.indigo,
                              boxShadow: [
                                BoxShadow(color: Color.fromRGBO(50, 20, 200, 0.2), blurRadius: 20, offset: Offset(0,10)),
                              ]
                          ),
                          child: Center(
                            child: FlatButton(
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image(
                                      image: AssetImage("assets/images/f1.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text("Facebook", style: TextStyle(color: Colors.white),),
                                ],
                              ),
                              onPressed: (){},
                            ),
                          )
                      )
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 50),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(color: Color.fromRGBO(245, 50, 50, 0.3), blurRadius: 20, offset: Offset(0,10)),
                              ]
                          ),
                          child: Center(
                            child:  FlatButton(
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image(
                                      image: AssetImage("assets/images/google.JPG"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text("Google", style: TextStyle(color: Colors.white),),
                                ],
                              ),
                              onPressed: (){},
                            ),
                          )
                      )
                  ),
                ],
              ),
              SizedBox(height: 50,),
              //Oxirgi qator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    child: Center(
                      child: Text("Don't have an account?", style: TextStyle(fontSize: 16),),
                    ),
                  ),
                  SizedBox(width: 5,),
                  GestureDetector(
                    child: Container(
                      child: Text("Sign Up", style: TextStyle(fontSize: 16, color: Colors.blue[800], fontWeight: FontWeight.bold),) ,
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, "sign_up_page");
                    },
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
