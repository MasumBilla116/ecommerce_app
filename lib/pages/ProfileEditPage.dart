import 'package:ecommerce/components/circle/textCircle.dart';
import 'package:ecommerce/components/inputFields/inputField.dart';
import 'package:ecommerce/utils/app.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:file_picker/file_picker.dart';

class ProfileEditPage extends StatefulWidget {
  State<ProfileEditPage> createState() => _ProfileEditPage();
}

// Name , Phone number , Address , profile
class _ProfileEditPage extends State<ProfileEditPage> {
  void _pickFile() async {
    // FilePickerResult? result = await FilePicker.platform.pickFiles();
    // if (result != null) {
    //   PlatformFile file = result.files.first;
    //   print('File path: ${file.path}');
    //   print('File name: ${file.name}');
    //   print('File size: ${file.size}');
    // } else {
    //   // The user canceled the file picker.
    //   print('User canceled the file picker.');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithLeading("Edit Profile", context),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage("assets/images/profile/profile.jpg"),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                    onPressed: _pickFile,
                    child: Text("Upload Profile"),
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(transparentColor),
                      elevation: const MaterialStatePropertyAll(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                            color: baseColor,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              inputField(title: 'Name', hintText: "Enter your name"),
              const SizedBox(
                height: 10,
              ),
              inputField(
                  title: 'Phone Number', hintText: "Enter your phone number"),
              const SizedBox(
                height: 10,
              ),
              inputField(
                  title: 'Address ',
                  hintText: "Enter your address",
                  maxLine: 4),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Update",
                    style: const TextStyle(color: whiteColor),
                  ),
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(baseColor),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
