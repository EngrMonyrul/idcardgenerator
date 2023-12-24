import 'package:flutter/material.dart';

Container emptyWidget(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height * .8,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Text(
      'No Scanned Files',
      style: TextStyle(fontSize: 20),
    ),
  );
}
