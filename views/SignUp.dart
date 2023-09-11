import 'package:flutter/material.dart';
import 'package:notes/views/LogIn.dart';

import '../constants.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomText.dart';
import '../widgets/CustomTextField.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(height: 30,width: 30,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: buttonBorderColor),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          size: 20,
                        ),
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  CustomText(
                    text: "Sign up",
                    size: 30,
                    color: titleColor,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Sign up with one of the following.",
                color: smallTextColor,
                size: 16,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        child: Icon(
                          Icons.g_mobiledata,
                          size: 60,
                        ),
                        borderColor: buttonBorderColor,
                        height: 60,
                        onpress: () {}),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomButton(
                        child: Icon(
                          Icons.apple,
                          size: 40,
                        ),
                        borderColor: buttonBorderColor,
                        height: 60,
                        onpress: () {}),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                hint: "Jhon doe",
                headerText: "Name*",
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                hint: "Enter your email",
                headerText: "Email*",
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                hint: "Create a password",
                isPassword: true,
                headerText: "Password*",
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: "Must be at least 8 characters",
                color: smallTextColor,
                size: 16,
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                child: CustomText(
                  text: "Log In",
                  align: Alignment.center,
                ),
                onpress: () {},
                gradient: gradient,
                height: 70,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Already have an account?",
                    color: smallTextColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      child: CustomText(text: "Log in"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
