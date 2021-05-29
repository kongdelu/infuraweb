// import 'dart:html';

import 'dart:async';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infuraweb/net/http_manager.dart';
import 'package:infuraweb/utils/encrypt_util.dart';
import 'package:infuraweb/widgets/aes_widget.dart';
import 'package:infuraweb/widgets/base64_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'infura.top 加解密第一站',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'infura.top 加解密第一站'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String market;

  @override
  void initState() {
    // TODO: implement initState

    // 每5分钟循环调用一次,权限查询接口
    // Timer.periodic(Duration(milliseconds: 5000), (timer) async {
    //
    //   BaseOptions options = BaseOptions();
    //   options.headers['Access-Control-Allow-Origin'] = '*';
    //   options.headers['Accept'] = 'application/json';
    //   ///创建Dio对象
    //   Dio dio = new Dio(options);
    //   ///请求地址 获取用户列表
    //   String url = "https://fxhapi.feixiaohao.com/public/v1/ticker?limit=1";
    //   ///发起get请求
    //   Response response = await dio.get(url);
    //   ///响应数据
    //  //List json = response.data;
    //   // List<Map<String,dynamic>> jsonList = convert.jsonDecode(json);
    //   // Map<String,dynamic> jsonMap = jsonList[0];
    //   market = response.data[0]['price_usd'].toString();
    //   print('>>>'+response.data[0].toString());
    //   setState(() {
    //
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    AESWidget.keyController.text = '12345678abcd@#_123456@#_kongdelu';
    AESWidget.ivController.text = '0000000000000000';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        toolbarHeight: 80,
        elevation: 0,
        title: Text(widget.title,style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700,color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 18,top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 600,
                  padding: EdgeInsets.only(left: 10,right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white, // 底色
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20, //阴影范围
                        spreadRadius: .5, //阴影浓度
                        color: Color(0xE7E8E9), //阴影颜色
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6), // 圆角也可控件一边圆角大小
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text('AES 加解密',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text('KEY',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),),
                          SizedBox(
                            width: 5,
                          ),
                          Text('(为32、48、64个字符)',style: TextStyle(fontSize: 14,color: Colors.grey),),
                        ],
                      ),
                      AESWidget.keyField,
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text('IV',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),),
                          SizedBox(
                            width: 5,
                          ),
                          Text('(为16个字符)',style: TextStyle(fontSize: 14,color: Colors.grey),),
                        ],
                      ),
                      AESWidget.ivField,
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text('明文',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),),
                        ],
                      ),
                      AESWidget.textField,
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text('密文',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),),
                        ],
                      ),
                      AESWidget.encryptField,
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 48.0,
                        onPressed: () async {
                          String keyStr = AESWidget.keyController.text;
                          String ivStr = AESWidget.ivController.text;

                          String text = AESWidget.textController.text;
                          String enStr = AESWidget.enctyptController.text;
                          if(text.length > 0){
                            var enStr = XEncryptUtil.aesEncrypt(text,keyStr,ivStr);
                            AESWidget.enctyptController.text = enStr;
                          }
                          else if (enStr.length > 0) {
                            var deStr = XEncryptUtil.aesDecrypt(enStr,keyStr,ivStr);
                            AESWidget.textController.text = deStr;
                          }
                        },
                        color: Colors.lightBlueAccent,
                        child: new Text('加/解密',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.3,
                //   height: 300,
                //   padding: EdgeInsets.only(left: 10,right: 10),
                //   decoration: BoxDecoration(
                //     color: Colors.white, // 底色
                //     boxShadow: [
                //       BoxShadow(
                //         blurRadius: 20, //阴影范围
                //         spreadRadius: .5, //阴影浓度
                //         color: Color(0xE7E8E9), //阴影颜色
                //       ),
                //     ],
                //     borderRadius: BorderRadius.circular(6), // 圆角也可控件一边圆角大小
                //   ),
                //   child: Column(
                //     children: [
                //       Center(
                //         child: Text('Base64 编解码',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                //       ),
                //       SizedBox(
                //         height: 30,
                //       ),
                //       Base64Widget.textField,
                //       SizedBox(
                //         height: 30,
                //       ),
                //       Base64Widget.encryptField,
                //       SizedBox(
                //         height: 30,
                //       ),
                //       MaterialButton(
                //         minWidth: double.infinity,
                //         height: 45.0,
                //         onPressed: (){
                //           String text = Base64Widget.textController.text;
                //
                //
                //         },
                //         color: Colors.blue,
                //         child: new Text('编码',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            color: Colors.lightGreen,
          ),
          Container(
            color: Colors.grey,
          )
        ],
      )
    );
  }
}
