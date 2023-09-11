import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'package:notes/views/SignUp.dart';
import 'package:notes/widgets/CustomButton.dart';
import 'package:notes/widgets/CustomText.dart';
import 'package:notes/widgets/CustomTextField.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [GestureDetector(
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
                    text: "Log In",
                    size: 30,
                    color: titleColor,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Log in with one of the following.",
                color: smallTextColor,
                size: 16,
              ),
              SizedBox(
                height: 50,
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
                height: 50,
              ),
              CustomTextField(
                hint: "example@gmail.com",
                headerText: "Email*",
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                hint: "********",
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
                    text: "Don't have an account?",
                    color: smallTextColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: CustomText(text: "Sign Up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
