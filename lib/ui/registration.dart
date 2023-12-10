import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
                height: 150,
                width: 100,
                margin: const EdgeInsets.all(10),
                child: const Image(
                    image: AssetImage('assets/loginpageshopping cart.jfif'))),
          ),
         // const SizedBox(
          //  height: 3,
         // ),
          Container(
              height: 40,
              width: double.maxFinite,
              color: Color.fromARGB(255, 224, 222, 222),
              child: const Center(
                child: Text(
                  "Register",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 50, 223, 55),
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              )),
          loginDetails(
              label: 'Enter your email',
              button: const Icon(Icons.person),
              heading: 'Email'),
          //const SizedBox(
            //height: 5,
          //),
          loginDetails(
              label: 'Enter first name',
              button: const Icon(Icons.person),
              heading: 'First Name'),
          //const SizedBox(
           // height: 5,
          //),
          loginDetails(
              label: 'Enter last name',
              button: const Icon(Icons.person),
              heading: 'Last Name'),
          //const SizedBox(
           // height: 5,
          //),
          loginDetails(
              label: 'Enter your password',
              button: const Icon(Icons.visibility),
              heading: 'password'),
              const SizedBox(
           height: 8,
          ),
          SizedBox(
            height: 40,
            width: double.maxFinite,
            child: OutlinedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const ))
              },
              child: Text(
                'Register',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                side: BorderSide(color: Colors.black, width: 2),
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column loginDetails(
      {required String label, required Icon button, required String heading}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            heading,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.right,
          ),
        ),
        TextField(
            decoration: InputDecoration(
          suffixIcon: (button),
          hintText: label,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        )),
      ],
    );
  }
}
