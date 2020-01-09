import 'dart:async';
import 'dart:typed_data';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'common/HttpCommonUtil.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String barcode = '';
  Uint8List bytes = Uint8List(200);
  String orderId = ''; // 订单号
  String odd = '';  // 快递单号
  String companyName = ''; // 快递公司
  String recName = ''; // 收件人
  String recTel = ''; // 收件电话
  String address = ''; //  快递寄达地址
  String recAddress = ''; // 收货地址
  String remark = ''; // 备注
  String courierFrontName = ''; // 配送员前台名
  String orderStatus = ''; // 订单状态
  String courierRemark = ''; // 配送员备注
  String paymentStatus = ''; // 支付状态
  String paymentType = ''; // 支付方式
  String paymentId = ''; // 支付流水号
  String payment = ''; // 支付金额
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('扫一扫支付订单'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(3),
                child: Text('订单号：'+this.orderId, ),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('快递单号：'+this.odd),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('快递公司：'+this.companyName),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('收件人：'+this.recName),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('收件电话：'+this.recTel),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('快递寄达地址：'+this.address),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('收货地址：'+this.recAddress),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('备注：'+this.remark),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('配送员前台名：'+this.courierFrontName),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('订单状态：'+this.orderStatus),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('配送员备注：'+this.courierRemark),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('支付状态：'+this.paymentStatus),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('支付方式：'+this.paymentType),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('支付流水号：'+this.paymentId),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child:Text('支付金额：'+this.payment),
              ),
              GestureDetector(
                  onTap: () => _scan(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(3.0)
                    ),
                    child: Text("扫一扫", style: TextStyle(color: Colors.white,fontSize: 24,)),
                  )
              ),
              GestureDetector(
                  onTap: () => _scanPhoto(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(3.0)
                    ),
                    child: Text("本地获取图片扫描", style: TextStyle(color: Colors.white,fontSize: 24,)),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _scan() async {
    await scanner.scan().then((barcode){
      this.barcode = barcode;
      HttpUtil.get(
          BaseUrl.url+'/api/v1/public/order/info/'+barcode,
          success: (result) {
            if (ObjectUtil.isNotEmpty(result)) {
              setState((){
                this.orderId = ObjectUtil.isNotEmpty(result['orderId'])?result['orderId']:'';
                this.odd = ObjectUtil.isNotEmpty(result['odd'])?result['odd']:'';  // 快递单号
                this.companyName = ObjectUtil.isNotEmpty(result['companyName'])?result['companyName']:''; // 快递公司
                this.recName = ObjectUtil.isNotEmpty(result['recName'])?result['recName']:''; // 收件人
                this.recTel = ObjectUtil.isNotEmpty(result['recTel'])?result['recTel']:''; // 收件电话
                this.address = ObjectUtil.isNotEmpty(result['address'])?result['address']:''; //  快递寄达地址
                this.recAddress = ObjectUtil.isNotEmpty(result['recAddress'])?result['recAddress']:''; // 收货地址
                this.remark = ObjectUtil.isNotEmpty(result['remark'])?result['remark']:''; // 备注
                this.courierFrontName = ObjectUtil.isNotEmpty(result['courierFrontName'])?result['courierFrontName']:''; // 配送员前台名
                this.orderStatus = ObjectUtil.isNotEmpty(result['orderStatus'])?result['orderStatus']:''; // 订单状态
                this.courierRemark = ObjectUtil.isNotEmpty(result['courierRemark'])?result['courierRemark']:''; // 配送员备注
                this.paymentStatus = ObjectUtil.isNotEmpty(result['paymentStatus'])?result['paymentStatus']:''; // 支付状态
                this.paymentType = ObjectUtil.isNotEmpty(result['paymentType'])?result['paymentType']:''; // 支付方式
                this.paymentId = ObjectUtil.isNotEmpty(result['paymentId'])?result['paymentId']:''; // 支付流水号
                this.payment = ObjectUtil.isNotEmpty(result['payment'])?result['payment']:''; // 支付金额
              });
            }
          }
      );
    });
  }

  Future _scanPhoto() async {
    await scanner.scanPhoto().then((barcode){
      this.barcode = barcode;
      HttpUtil.get(
          BaseUrl.url+'/api/v1/public/order/info/'+barcode,
          success: (result) {
            if (ObjectUtil.isNotEmpty(result)) {

              setState((){
                this.orderId = ObjectUtil.isNotEmpty(result['orderId'])?result['orderId']:'';
                this.odd = ObjectUtil.isNotEmpty(result['odd'])?result['odd']:'';  // 快递单号
                this.companyName = ObjectUtil.isNotEmpty(result['companyName'])?result['companyName']:''; // 快递公司
                this.recName = ObjectUtil.isNotEmpty(result['recName'])?result['recName']:''; // 收件人
                this.recTel = ObjectUtil.isNotEmpty(result['recTel'])?result['recTel']:''; // 收件电话
                this.address = ObjectUtil.isNotEmpty(result['address'])?result['address']:''; //  快递寄达地址
                this.recAddress = ObjectUtil.isNotEmpty(result['recAddress'])?result['recAddress']:''; // 收货地址
                this.remark = ObjectUtil.isNotEmpty(result['remark'])?result['remark']:''; // 备注
                this.courierFrontName = ObjectUtil.isNotEmpty(result['courierFrontName'])?result['courierFrontName']:''; // 配送员前台名
                this.orderStatus = ObjectUtil.isNotEmpty(result['orderStatus'])?result['orderStatus']:''; // 订单状态
                this.courierRemark = ObjectUtil.isNotEmpty(result['courierRemark'])?result['courierRemark']:''; // 配送员备注
                this.paymentStatus = ObjectUtil.isNotEmpty(result['paymentStatus'])?result['paymentStatus']:''; // 支付状态
                this.paymentType = ObjectUtil.isNotEmpty(result['paymentType'])?result['paymentType']:''; // 支付方式
                this.paymentId = ObjectUtil.isNotEmpty(result['paymentId'])?result['paymentId']:''; // 支付流水号
                this.payment = ObjectUtil.isNotEmpty(result['payment'])?result['payment']:''; // 支付金额
              });
            }
          }
      );
    });
  }

}