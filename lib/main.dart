import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:shopping_cart/ui/home_page.dart';

import 'model/loginresponsemodel.dart';
import 'ui/registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String url = "https://dummyjson.com/auth/login";

  bool isLoading = false;

  Future<void> getUserData() async {
    setState(() {
      isLoading=true;
    });
    
    var response = await http.post(Uri.parse(url),
        body: {"username": nameController.text, "password": passwordController.text});
    late LoginResponseModel loginresponsemodel;

    var decodedResponse = jsonDecode(response.body);

    setState(() {
      loginresponsemodel = LoginResponseModel.fromJson(decodedResponse);
      
      if (loginresponsemodel.token == "") {
        var snackBar = const SnackBar(
          content: Text('invalid credentials'),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      }

    
    });
    setState(() {
      isLoading=false;
    
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.all(20),
            child:
                Image(image: AssetImage('assets/loginpageshopping cart.jfif'))),
      ),
      const SizedBox(
        height: 3,
      ),
      Container(
          height: 40,
          width: double.maxFinite,
          color: Color.fromARGB(255, 224, 222, 222),
          child: const Center(
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 50, 223, 55),
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          )),
      loginDetails(
          label: 'Enter your email',
          button: const Icon(Icons.person),
          heading: 'Email',
          controller: nameController),
      const SizedBox(
        height: 5,
      ),
      loginDetails(
          label: 'Enter your password',
          button: const Icon(Icons.visibility),
          heading: 'password',
          controller: passwordController),
      const SizedBox(
        height: 10,
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(children: [
          Spacer(),
          Text(
            'Forget Password ?',
            style: TextStyle(decoration: TextDecoration.underline),
          )
        ]),
      ),
      SizedBox(
          height: 40,
          width: double.maxFinite,
          child:(isLoading==false)?
             OutlinedButton(
              onPressed: () {
            
                getUserData();
                  
                
              },
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w900, color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                side: BorderSide(color: Colors.black, width: 3),
                backgroundColor: Colors.green,
              ),
                       ):Center(child: Text('LOADING..'))
        
        ),
      
      SizedBox(height: 5),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            orFunction(),
            const Center(
              child: Text(
                'OR',
                style: TextStyle(fontSize: 20),
              ),
            ),
            orFunction()
          ],
        ),
      ),
      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 182, 181, 181)),
        height: 40,
        width: double.maxFinite,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.g_mobiledata_sharp,
              ),
            ),
            Center(
              child: Text(
                'Login with Google',
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 124, 123, 123)),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Center(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegistrationPage()));
            },
            child: newReg()),
      )
    ]));
  }

  RichText newReg() {
    return RichText(
        text: const TextSpan(
            text: 'Dont have acoount?',
            style: TextStyle(fontSize: 15, color: Colors.black),
            children: [
          TextSpan(text: 'Register', style: TextStyle(color: Colors.green)),
        ]));
  }

  Container orFunction() {
    return Container(
      padding: const EdgeInsets.only(
        left: 180,
        top: 2,
      ),
      color: Colors.black,
    );
  }

  Column loginDetails(
      {required String label,
      required Icon button,
      required String heading,
      required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            heading,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.right,
          ),
        ),
        TextField(
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: (button),
              hintText: label,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            )),
      ],
    );
  }
}
