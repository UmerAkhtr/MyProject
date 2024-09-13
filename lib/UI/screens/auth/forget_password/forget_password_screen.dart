import 'package:flutter/material.dart';

class forget_password_screen extends StatefulWidget {
  const forget_password_screen({super.key});

  @override
  State<forget_password_screen> createState() => _forget_password_screenState();
}

class _forget_password_screenState extends State<forget_password_screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: Colors.transparent,
          title: Text('Forget\nPassword', style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
        ),
        body:
        Padding(
          padding:  EdgeInsets.only(top: 170),
          child: Column(
            children: [
              Text('Please enter your email to reset the password', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Email",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,

                    height: 50,
                    width: 160,
                    child: Text('Reset Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,),),
                    alignment: Alignment.center,

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
