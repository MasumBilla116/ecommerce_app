import 'package:ecommerce/components/background/BgTopImage.dart';
import 'package:ecommerce/components/buttons/customButton.dart';
import 'package:ecommerce/components/inputFields/inputField.dart';
import 'package:ecommerce/utils/app.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/const.dart';
import 'package:ecommerce/utils/images.dart';
import 'package:ecommerce/utils/navigationMenu.dart';
import 'package:flutter/material.dart';
import "package:ecommerce/utils/string.dart";

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                margin: const EdgeInsets.only(top: 20),
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
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          side: const BorderSide(
                              color:
                                  orangeColor), // Change the border color and width
                          activeColor:
                              orangeColor, // Change the fill color when checked
                          checkColor: whiteColor,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: agreeText,
                                  style: TextStyle(
                                    color: agreeTextColor,
                                  ),
                                ),
                                TextSpan(
                                  text: termsAndConditionText,
                                  style: TextStyle(
                                    color: termsTextColor,
                                  ),
                                ),
                                TextSpan(
                                  text: " " + and + " " + privacyAndPolicy,
                                  style: TextStyle(
                                    color: privacyAndPolicyTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    customButton(
                        title: signupText,
                        btnBgColor: isChecked!
                            ? orangeColor
                            : const Color.fromARGB(75, 255, 193, 7)),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          back(context);
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
    );
  }
}
