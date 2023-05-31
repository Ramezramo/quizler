import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert(
context: context,
type: AlertType.info,
title: "GeeksForGeeks",
desc: "Create more awesome alerts with RFlutter Alert.",
buttons: [
DialogButton(
child: Text(
"Done",
style: TextStyle(color: Colors.white, fontSize: 20),
),
onPressed: () => Navigator.pop(context),
width: 120,
),
DialogButton(
child: Text(
"Cancel",
style: TextStyle(color: Colors.white, fontSize: 20),
),
onPressed: () => Navigator.pop(context),
width: 120,
)
],
).show();
