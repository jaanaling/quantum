import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:quantum/src/feature/balance/models/asset.dart';
import 'package:quantum/src/feature/balance/presentation/screens/balance_screen.dart';
import 'package:quantum/ui_kit/text_field/text_field.dart';

class AddAsset extends StatefulWidget {
  final Asset? asset;
  const AddAsset({super.key, this.asset});

  @override
  State<AddAsset> createState() => _AddAssetState();
}

class _AddAssetState extends State<AddAsset> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController exchangeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.asset != null) {
      nameController.text = widget.asset?.name ?? '';
      quantityController.text = widget.asset!.quantity.toInt().toString();
      priceController.text = widget.asset!.purchasePrice.toString();
      exchangeController.text = widget.asset!.currentPrice.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Gap(15),
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Color(0xFF5C81F8),
              borderRadius: BorderRadius.circular(32),
              onTap: () {
                context.pop();
              },
              child: Ink(
                width: 61,
                height: 61,
                decoration: ShapeDecoration(
                  color: Color(0xFF3764F3),
                  shape: OvalBorder(),
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Gap(20),
          Container(
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF3700FF), Color(0xFF537BFF)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
              shadows: [
                const BoxShadow(
                  color: Color(0x21000000),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                children: [
                  AppTextField(
                    controller: nameController,
                    placeholder: 'Enter name...',
                    topText: 'Asset name',
                  ),
                  Gap(15),
                  Row(
                    children: [
                      AppTextField(
                        controller: quantityController,
                        placeholder: 'Enter number...',
                        topText: 'Number of units',
                        textInputType: TextInputType.number,
                      ),
                      const Gap(20),
                      AppTextField(
                        controller: priceController,
                        placeholder: 'Enter price...',
                        topText: 'Purchase price/unit',
                        textInputType: TextInputType.number,
                      ),
                    ],
                  ),
                  Gap(19),
                  Row(
                    children: [
                      if (widget.asset != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: AppTextField(
                            controller: exchangeController,
                            placeholder: 'Enter exchange...',
                            topText: 'Current exchange',
                            textInputType: TextInputType.number,
                          ),
                        ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Color(0xFFDEDEDE),
                          onTap: () {},
                          borderRadius: BorderRadius.circular(10),
                          child: Ink(
                            height: 51,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'currency',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Cygre Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                Gap(13),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.black.withOpacity(0.5),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(15),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Color(0xFF5C81F8),
                      borderRadius: BorderRadius.circular(29),
                      onTap: () {},
                      child: Ink(
                        width: 222,
                        height: 58,
                        decoration: ShapeDecoration(
                          color: Color(0xFF3764F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            widget.asset != null
                                ? 'change asset'
                                : '+ add asset',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'cygre',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
