import 'package:flutter/material.dart';
import 'package:flutter_express/NoticePage.dart';
import 'package:flutter_express/OrderPage.dart';

import 'ScanPage.dart';

class IndexPage extends StatefulWidget {

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              children: <Widget>[
                SizedBox(
                  height: kToolbarHeight,
                ),
                _buildTitle(),
                _buildTitleLine(),
                SizedBox(height: 70.0),
                _buildNoticeField(context),
                _buildScanField(context),
                _buildOrderField(context),
                SizedBox(height: 30.0,),
              ],
            )));
  }

  Padding _buildTitleLine() {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, top: 4.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 40.0,
          height: 2.0,
        ),
      ),
    );
  }

  Padding _buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '首页',
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }

  Padding _buildNoticeField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (_){
                return NoticePage();
              }));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(28.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(3.0)
              ),
              child: Text("公告信息", style: TextStyle(color: Colors.white,fontSize: 24,)),
            )
        )
      ),
    );
  }

  Padding _buildScanField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
          child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_){
                  return ScanPage();
                }));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(28.0),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(3.0)
                ),
                child: Text("扫一扫", style: TextStyle(color: Colors.white,fontSize: 24,)),
              )
          )
      ),
    );
  }

  Padding _buildOrderField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
          child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_){
                  return OrderPage();
                }));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(28.0),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(3.0)
                ),
                child: Text("订单信息", style: TextStyle(color: Colors.white,fontSize: 24,)),
              )
          )
      ),
    );
  }
}
