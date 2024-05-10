import "package:ecommerce/language/Language.dart";
import "package:ecommerce/method/addTocart.dart";
import "package:ecommerce/utils/colors.dart";
import "package:ecommerce/utils/icons.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class AddToCardButton extends StatefulWidget {
  final dynamic cartProduct;
  final Function? updateCartItems;
  final bool? isExistInCartProduct;
  const AddToCardButton(
      {required this.cartProduct,
      this.updateCartItems,
      this.isExistInCartProduct = false,
      Key? key})
      : super(key: key);
  @override
  State<AddToCardButton> createState() => _AddToCardButtonState();
}

class _AddToCardButtonState extends State<AddToCardButton> {
  int selectedCardOption = 1;

  @override
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
        title: Text(Language.load("add_to_cart")),
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
              title: Text(Language.load("add_to_piece")),
            ),
            RadioListTile(
              value: 2,
              groupValue: selectedCardOption,
              onChanged: (int? value) {
                setState(() {
                  selectedCardOption = value as int;
                });
              },
              title: Text(Language.load("add_to_boundel")),
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
            child: Text(
              Language.load("cancel"),
              style: const TextStyle(color: whiteColor),
            ),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(greenColor)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              Language.load("add"),
              style: const TextStyle(color: whiteColor),
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
        /**
       * Note: Don't remove _showAddCardDialog method 
       * this method for buyer
        ** _showAddCardDialog(context);  // dont remove
      */
        setState(() {
          addToCart(widget.cartProduct);
          if (widget.updateCartItems != null) {
            widget.updateCartItems!();
          }
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          baseColor,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(left: 5, right: 5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isExistInCartProduct == true
              ? const Icon(
                  onlyShoppingCartPlusIcon,
                  color: orangeColor,
                )
              : const Icon(
                  onlyShoppingCartIcon,
                  color: orangeColor,
                ),
          const SizedBox(
            width: 5,
          ),
          Text(
            widget.isExistInCartProduct == true
                ? Language.load("already_added")
                : Language.load("add_to_cart"),
            style: const TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
