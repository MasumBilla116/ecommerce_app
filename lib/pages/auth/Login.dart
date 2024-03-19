import 'package:ecommerce/components/background/BgTopImage.dart';
import 'package:ecommerce/components/buttons/customButton.dart';
import 'package:ecommerce/components/inputFields/inputField.dart';
import 'package:ecommerce/utils/app.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/images.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                loginTitle(textColor: Colors.white, fontSize: 12),
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
                      inputField(title: "Email", hintText: emailHintText),
                      const SizedBox(
                        height: 10,
                      ),
                      inputField(title: "Password", hintText: passwordHintText),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(forgetPasswordText)),
                      ),
                      customButton(title: signinText),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () {
                              goToRegisterPage(context);
                            },
                            child: const Text(createNewAccount)),
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
