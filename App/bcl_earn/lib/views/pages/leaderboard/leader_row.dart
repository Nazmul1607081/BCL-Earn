import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/models/withdraw.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyTable {
  static TableRow row(int sn, MyUser myUser) {
    double frontSize = 18;

    return TableRow(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29d6d6d6),
              offset: Offset(0, 13),
              blurRadius: 20,
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: '$sn',
              color: Colors.black,
              size: frontSize - 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: '${myUser.name}',
              color: Colors.black,
              size: frontSize,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: '${myUser.balance}',
              color: Colors.black,
              size: frontSize,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: '${myUser.refer}',
              color: Colors.black,
              size: frontSize,
            ),
          ),
        ]);
  }

  static TableRow rowOfHistory(int sn, MyWithDraw myWithDraw) {
    double frontSize = 18;

    return TableRow(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xffffffff),
          border: Border.all(
            width: 1.0,
            color: Colors.black,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29d6d6d6),
              offset: Offset(0, 13),
              blurRadius: 20,
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: '$sn',
              color: Colors.black,
              size: frontSize,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: '${myWithDraw.number}',
              color: Colors.black,
              size: 10,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: '${myWithDraw.medium}',
              color: Colors.black,
              size: 12,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: '${myWithDraw.amount}',
              color: Colors.black,
              size: 12,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label:
                  '${myWithDraw.time.toDate().day}-${myWithDraw.time.toDate().month}-'
                  '${myWithDraw.time.toDate().year.toString()[2]}${myWithDraw.time.toDate().year.toString()[3]}',
              color: Colors.black,
              size: 10,
            ),
          ),
          (myWithDraw.status)
              ? Padding(
                  padding: EdgeInsets.all(5.0),
                  child: MyText(
                    label: 'Paid',
                    color: Colors.green,
                    size: frontSize,
                  ))
              : Padding(
                  padding: EdgeInsets.all(5.0),
                  child: MyText(
                    label: 'Unpaid',
                    color: Colors.redAccent,
                    size: 10,
                  ),
                ),
        ]);
  }

  static TableRow head() {
    double frontSize = 13;

    return TableRow(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29d6d6d6),
              offset: Offset(0, 13),
              blurRadius: 20,
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'Rank',
              color: Colors.black,
              size: frontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'User Name',
              color: Colors.black,
              size: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'Point',
              color: Colors.black,
              size: frontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'Refer',
              color: Colors.black,
              size: frontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]);
  }

  static TableRow headOfHistory() {
    double frontSize = 18;
    double borderRadius = 10;

    return TableRow(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: const Color(0xffffffff),
          border: Border.all(
            width: 1.0,
            color: Colors.black,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29d6d6d6),
              offset: Offset(0, 13),
              blurRadius: 20,
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'No',
              color: Colors.black,
              size: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'Number',
              color: Colors.black,
              size: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'Via',
              color: Colors.black,
              size: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'Amount',
              color: Colors.black,
              size: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'Time',
              color: Colors.black,
              size: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'Status',
              color: Colors.black,
              size: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]);
  }
}
