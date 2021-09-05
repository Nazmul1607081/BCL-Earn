import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/images.dart';
import 'package:bcl_earn/controllers/package/package_controller.dart';
import 'package:bcl_earn/controllers/withdraw/withdraw_controller.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/models/payment.dart';
import 'package:bcl_earn/views/pages/signup/signup_page.dart';
import 'package:bcl_earn/views/widgets/form_field.dart';
import 'package:bcl_earn/views/widgets/login_button.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPackageBody extends StatefulWidget {
  MyPackageBody({Key key}) : super(key: key);

  @override
  _MyPackageBodyState createState() => _MyPackageBodyState();
}

class _MyPackageBodyState extends State<MyPackageBody> {
  final packageController = Get.put(MyPackageController());

  final withdrawController = Get.put(MyWithDrawController());

  final adminController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    int i;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: Get.size.height / 16,
              ),
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
                      key: packageController.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Get.size.height / 16,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: MyText(
                              label: "Upgrade your package to premium",
                              color: Colors.green,
                              size: 20,
                              fontWeight: FontWeight.bold,
                              textAlignment: TextAlign.center,
                            ),
                          ),

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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  MyText(
                                    label: "Premium Package",
                                    size: 18,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  MyText(
                                    label: "Double your points",
                                    size: 18,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ),
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
                                        label:
                                            "Price: ${adminController.myAdmin.premiumPrice}",
                                        size: 18,
                                        color: Colors.black,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          MyTextFormField(
                              controller: packageController.mobileController,
                              labelText: 'Number',
                              onChange: (val) {},
                              obscureText: false,
                              isPass: false,
                              keyBoard: TextInputType.number,
                              validationMassage: "Number required",
                              padding: EdgeInsets.all(2)),
                          MyTextFormField(
                            controller: packageController.transactionController,
                            labelText: 'Transaction Number',
                            onChange: (val) {},
                            obscureText: false,
                            isPass: false,
                            keyBoard: TextInputType.number,
                            validationMassage: "Transaction Number required",
                            padding: EdgeInsets.all(2),
                          ),
                          //bkash
                          Container(
                            height: 50,
                            child: Obx(() => ListView.builder(
                                //shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                //physics: ScrollPhysics(),
                                itemCount: withdrawController.methods.length,
                                itemBuilder: (_, index) {
                                  return (withdrawController
                                              .methods[index].name ==
                                          'Recharge')
                                      ? Container(
                                          color: Colors.red,
                                        )
                                      : Material(
                                          child: Row(
                                            children: [
                                              Radio<MyPayment>(
                                                value: withdrawController
                                                    .methods[index],
                                                groupValue: withdrawController
                                                    .medium.value,
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
                                          ),
                                        );
                                })),
                          ),
                          /*Obx(() => Wrap(
                                children: [
                                  for (i = 0;
                                      i < withdrawController.methods.length;
                                      i++)
                                    (withdrawController.methods[i].name ==
                                            'Recharge')
                                        ? Container(
                                            color: Colors.red,
                                          )
                                        : Row(
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
                                                  "${withdrawController.methods[i].name}"),
                                            ],
                                          ),
                                ],
                              )),*/

                          ///button
                          Center(
                            child: MyLoginButton(
                              label: "Pay",
                              onClick: () {
                                packageController.pay();
                              },
                              color: MyColors.appBarColor,
                              labelColor: Colors.white,
                            ),
                          ),

                          /// note
                          MyText(
                            label:
                                "We will confirmed your package within 1 hours",
                            color: Colors.black,
                            size: 16,
                            textAlignment: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          ///head
          Column(
            children: [
              SizedBox(
                height: Get.size.height / 16,
              ),
              Center(
                child: CircleAvatar(
                  radius: Get.height / 16 + 2,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Get.height / 16,
                    child: Icon(
                      Icons.landscape,
                      size: 60,
                      color: Colors.black,
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
