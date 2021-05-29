
import 'package:flutter/material.dart';

class Base64Widget {
  static final textController = TextEditingController();
  static final enctyptController = TextEditingController();

  static final textField = Container(
    constraints: BoxConstraints(
      maxHeight: 100.0,
      minHeight: 50.0,
    ),
    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 4.0),
    child: TextField(
      controller: textController,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      autofocus: true,
      decoration: InputDecoration(
        hintText: '明文',
        // 未获得焦点下划线设为灰色
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        //获得焦点下划线设为蓝色
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    ),
  );

  static final encryptField = Container(
    constraints: BoxConstraints(
      maxHeight: 100.0,
      minHeight: 50.0,
    ),
    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 4.0),
    child: TextField(
      controller: enctyptController,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      autofocus: true,
      decoration: InputDecoration(
        hintText: '密文',
        // 未获得焦点下划线设为灰色
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        //获得焦点下划线设为蓝色
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    ),
  );
}