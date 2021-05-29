
import 'package:flutter/material.dart';

class AESWidget {
  static final keyController = TextEditingController();
  static final ivController = TextEditingController();
  static final textController = TextEditingController();
  static final enctyptController = TextEditingController();

  static final keyField = Container(
    constraints: BoxConstraints(
      maxHeight: 100.0,
      minHeight: 50.0,
    ),
    child: TextField(
      controller: keyController,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      autofocus: true,
      decoration: InputDecoration(
        hintText: '',
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
  static final ivField = Container(
    constraints: BoxConstraints(
      maxHeight: 100.0,
      minHeight: 50.0,
    ),
    child: TextField(
      controller: ivController,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      autofocus: true,
      decoration: InputDecoration(
        hintText: '',
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

  static final textField = Container(
    constraints: BoxConstraints(
      maxHeight: 100.0,
      minHeight: 50.0,
    ),
    child: TextField(
      controller: textController,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      autofocus: true,
      decoration: InputDecoration(
        hintText: '',
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
    child: TextField(
      controller: enctyptController,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      autofocus: true,
      decoration: InputDecoration(
        hintText: '',
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