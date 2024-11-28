import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:quantum/src/feature/balance/bloc/balance_bloc.dart';
import 'package:quantum/src/feature/balance/models/asset.dart';
import 'package:quantum/src/feature/balance/models/values.dart';
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
      selectedIndex = values.keys.toList().indexOf(widget.asset!.type);
    }
  }

  int selectedIndex = 0;

  void _showCountrySnackBar(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return ColoredBox(
          color: CupertinoColors.systemBackground,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Select Currency',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedIndex,
                  ),
                  itemExtent: 32.0,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  children: values.keys.map((String Currency) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.28,
                      ),
                      child: Row(
                        children: [
                          Image.asset(values[Currency]!, width: 32, height: 32),
                          const Gap(16),
                          Text(
                            Currency,
                            style: TextStyle(fontFamily: 'poppins'),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              CupertinoButton(
                child: const Text(
                  'Done',
                  style: TextStyle(color: CupertinoColors.activeBlue),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(15),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Color(0xAA5C81F8),
                borderRadius: BorderRadius.circular(32),
                onTap: () {
                  context.pop();
                },
                child: Ink(
                  width: 61,
                  height: 61,
                  decoration: ShapeDecoration(
                    color: Color(0xAA3764F3),
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
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Container(
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xAA3700FF), Color(0xAA537BFF)],
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppTextField(
                      width: MediaQuery.of(context).size.width * 0.9,
                      controller: nameController,
                      placeholder: 'Enter name...',
                      topText: 'Asset name',
                    ),
                    Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextField(
                          width: MediaQuery.of(context).size.width * 0.38,
                          controller: quantityController,
                          placeholder: 'Enter number...',
                          topText: 'Number of units',
                          textInputType: TextInputType.number,
                        ),
                        const Gap(20),
                        AppTextField(
                          width: MediaQuery.of(context).size.width * 0.38,
                          controller: priceController,
                          placeholder: 'Enter price...',
                          topText: 'Purchase price/unit',
                          textInputType: TextInputType.number,
                        ),
                      ],
                    ),
                    Gap(19),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (widget.asset != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: AppTextField(
                              width: MediaQuery.of(context).size.width * 0.4,
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
                            onTap: () {
                              _showCountrySnackBar(context);
                            },
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
                                  Gap(20),
                                  Image.asset(
                                    values[
                                        values.keys.toList()[selectedIndex]]!,
                                    width: 32,
                                    height: 32,
                                  ),
                                  const Gap(8),
                                  Text(
                                    values.keys.toList()[selectedIndex],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Gap(13),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(MediaQuery.of(context).size.height * 0.15),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Color(0xFF5C81F8),
                        borderRadius: BorderRadius.circular(29),
                        onTap: () {
                          if (widget.asset != null) {
                            context.read<BalanceBloc>().add(
                                  UpdateBalance(
                                    widget.asset!.copyWith(
                                      name: nameController.text,
                                      quantity: double.tryParse(
                                            quantityController.text,
                                          ) ??
                                          1,
                                      purchasePrice: double.tryParse(
                                              priceController.text) ??
                                          1,
                                      currentPrice: double.tryParse(
                                            exchangeController.text,
                                          ) ??
                                          1,
                                    ),
                                  ),
                                );
                          } else {
                            context.read<BalanceBloc>().add(
                                  SaveBalance(
                                    Asset(
                                      id: DateTime.now()
                                          .microsecondsSinceEpoch
                                          .toString(),
                                      name: nameController.text,
                                      type: values.keys.toList()[selectedIndex],
                                      quantity: double.tryParse(
                                            quantityController.text,
                                          ) ??
                                          1,
                                      purchasePrice: priceController.text == ''
                                          ? 0
                                          : double.parse(priceController.text),
                                      currentPrice: priceController.text == ''
                                          ? 0
                                          : double.parse(priceController.text),
                                    ),
                                  ),
                                );
                          }
                          context.pop();
                        },
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
          ),
        ],
      ),
    );
  }
}
