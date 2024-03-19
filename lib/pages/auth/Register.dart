import 'package:ecommerce/components/background/BgTopImage.dart';
import 'package:ecommerce/components/buttons/customButton.dart';
import 'package:ecommerce/components/inputFields/inputField.dart';
import 'package:ecommerce/utils/app.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/images.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return bgTopImage(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(top: 80),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  padding: const EdgeInsets.all(10),
                  child: appLogo,
                ),
                const SizedBox(
                  height: 10,
                ),
                registerTitle(textColor: Colors.white, fontSize: 12),
                Container(
                  width: MediaQuery.of(context).size.width - 70,
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: containerBgColorWhite,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [containerBoxShadow],
                  ),
                  child: Column(
                    children: [
                      inputField(title: "Name", hintText: nameHintText),
                      const SizedBox(
                        height: 10,
                      ),
                      inputField(title: "Email", hintText: emailHintText),
                      const SizedBox(
                        height: 10,
                      ),
                      inputField(title: "Phone", hintText: phoneNumberHintText),
                      const SizedBox(
                        height: 10,
                      ),
                      inputField(title: "Password", hintText: passwordHintText),
                      const SizedBox(
                        height: 10,
                      ),
                      inputField(
                        title: "Confirm Password",
                        hintText: confirmPasswordHintText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customButton(title: signupText),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            goToLoginPage(context);
                          },
                          child: const Text(iHaveAccount),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
