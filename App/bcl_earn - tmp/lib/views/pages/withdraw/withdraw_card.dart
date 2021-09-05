import 'dart:math';

import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/models/payment.dart';
import 'package:bcl_earn/views/widgets/form_field.dart';
import 'package:bcl_earn/views/widgets/login_button.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/controllers/withdraw/withdraw_controller.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';

class MyWithDrawCard extends StatefulWidget {
  MyWithDrawCard({Key key}) : super(key: key);

  @override
  _MyWithDrawCardState createState() => _MyWithDrawCardState();
}

class _MyWithDrawCardState extends State<MyWithDrawCard> {
  final userController = Get.put(AuthController());

  final withdrawController = Get.put(MyWithDrawController());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    setState(() {});
    int i;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              /*SizedBox(
                height: Get.size.height / 16,
              ),*/
              Padding(
                padding: EdgeInsets.all(Get.size.height / 16),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() => Padding(
                                padding: EdgeInsets.all(10.0),
                                child: MyText(
                                  label:
                                      "Your Balance:\n${userController.myUser.balance}",
                                  color: Colors.green,
                                  size: 24,
                                  fontWeight: FontWeight.bold,
                                  textAlignment: TextAlign.center,
                                ),
                              )),
                          Container(
                            height: 50,
                            child: Obx(() => ListView.builder(
                                //shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                //physics: ScrollPhysics(),
                                itemCount: withdrawController.methods.length,
                                itemBuilder: (_, index) {
                                  return Row(
                                    children: [
                                      Radio<MyPayment>(
                                        value:
                                            withdrawController.methods[index],
                                        groupValue:
                                            withdrawController.medium.value,
                                        onChanged: (MyPayment val) {
                                          setState(() {
                                            withdrawController
                                                .onMediumChange(val);
                                          });
                                        },
                                      ),
                                      Text(
                                          "${withdrawController.methods[index].name}"),
                                    ],
                                  );
                                })),
                          ),
                          /*Obx(() => Wrap(
                                children: [
                                  for (i = 0;
                                      i < withdrawController.methods.length - 1;
                                      i += 2)
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: withdrawController
                                              .methods[i].name,
                                          groupValue:
                                              withdrawController.medium.value,
                                          onChanged: (String val) {
                                            withdrawController.onMediumChange(
                                                withdrawController.methods[i]);
                                          },
                                        ),
                                        Text(
                                            "${withdrawController.methods[i + 1].name}"),
                                        Radio<String>(
                                          value: withdrawController
                                              .methods[i].name,
                                          groupValue:
                                              withdrawController.medium.value,
                                          onChanged: (String val) {
                                            withdrawController.onMediumChange(
                                                withdrawController
                                                    .methods[i + 1]);
                                          },
                                        ),
                                        Text(
                                            "${withdrawController.methods[i + 1].name}"),
                                      ],
                                    ),
                                  (i < withdrawController.methods.length)
                                      ? Row(
                                          children: [
                                            Radio<String>(
                                              value: withdrawController
                                                  .methods[i].name,
                                              groupValue: withdrawController
                                                  .medium.value,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              onChanged: (String val) {
                                                withdrawController
                                                    .onMediumChange(
                                                        withdrawController
                                                            .methods[i]);
                                              },
                                            ),
                                            Text(
                                                "${withdrawController.methods[i].name}")
                                          ],
                                        )
                                      : Container()
                                ],
                              )),*/

                          ///field
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(13),
                              child: Obx(() => Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      MyText(
                                        label: "${withdrawController.amount}",
                                        size: 18,
                                        color: Colors.black,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          MyTextFormField(
                            controller: withdrawController.mobileController,
                            labelText: 'Number',
                            onChange: (val) {},
                            obscureText: false,
                            isPass: false,
                            keyBoard: TextInputType.number,
                            validationMassage: "Number required",
                          ),

                          ///button
                          Center(
                            child: MyLoginButton(
                              label: "Withdraw",
                              onClick: () {
                                if (formKey.currentState.validate()) {
                                  withdrawController.withdraw();
                                }
                              },
                              color: MyColors.appBarColor,
                              labelColor: Colors.white,
                            ),
                          ),

                          ///text
                          SizedBox(
                            height: 5,
                          ),
                          Obx(() => ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: withdrawController.methods.length,
                              itemBuilder: (_, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: MyText(
                                        label:
                                            "${withdrawController.methods[index].name} ${withdrawController.methods[index].point} = ${withdrawController.methods[index].value} Taka",
                                        color: Colors.black,
                                        size: 16,
                                        textAlignment: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                );
                              })),

                          /// note
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: MyText(
                              label:
                                  "We will confirmed your payment within 1 hours",
                              color: Colors.black,
                              size: 18,
                              fontWeight: FontWeight.bold,
                              textAlignment: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
