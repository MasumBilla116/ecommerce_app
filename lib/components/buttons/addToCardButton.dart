import "package:ecommerce/language/Language.dart";
import "package:ecommerce/utils/colors.dart";
import "package:ecommerce/utils/navigationMenu.dart";
import "package:flutter/material.dart";

class AddToCardButton extends StatefulWidget {
  State<AddToCardButton> createState() => _AddToCardButtonState();
}

class _AddToCardButtonState extends State<AddToCardButton> {
  int selectedCardOption = 1;

  void initState() {
    super.initState();
  }

  void _showAddCardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _buildAddCardDialog(context),
    );
  }

  Widget _buildAddCardDialog(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const Text("Add to cart product"),
        contentPadding: const EdgeInsets.all(12),
        insetPadding: const EdgeInsets.all(12),
        titleTextStyle: const TextStyle(
            fontSize: 18, color: darkColor, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              value: 1,
              groupValue: selectedCardOption,
              onChanged: (int? value) {
                setState(() {
                  selectedCardOption = value as int;
                });
              },
              title: const Text("Add to piece"),
            ),
            RadioListTile(
              value: 2,
              groupValue: selectedCardOption,
              onChanged: (int? value) {
                setState(() {
                  selectedCardOption = value as int;
                });
              },
              title: const Text("Add to bundle"),
            ),
          ],
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(redColor)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: whiteColor),
            ),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(greenColor)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Add",
              style: TextStyle(color: whiteColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showAddCardDialog(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: whiteColor,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            Language.load("add_to_card"),
            style: TextStyle(
                color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 0, 158, 119)),
      ),
    );
  }
}
