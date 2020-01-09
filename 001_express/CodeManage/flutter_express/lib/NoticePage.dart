import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import 'common/HttpCommonUtil.dart';

class NoticePage extends StatefulWidget {

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  var _items = new List<String>();

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '公告信息',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('公告信息'),
        ),
        body: new RefreshIndicator(
          onRefresh: _onRefresh,
          child: new ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return ListTile(title:new Text('${_items[index]}'));
              },
              //分割线构造器
              separatorBuilder: (context,index){
                return new Divider(color: Colors.blue,);
              },
              //_items.length + 1是为了给最后一行的加载loading留出位置
              itemCount: _items.length
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await HttpUtil.get(
      BaseUrl.url+'/api/v1/public/notice',
      success: (result) {
        if (ObjectUtil.isNotEmpty(result)) {
          setState(() {
            for (int i = 0; i < result.length; i++) {
              _items.insert(i, "${result[i]['title']}");
            }
          });
        }
      }
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
