import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class ShareLocation extends StatefulWidget {
  ShareLocation({Key key}) : super(key: key);

  @override
  _ShareLocationState createState() => _ShareLocationState();
}

class _ShareLocationState extends State<ShareLocation> {

  TextEditingController startController = TextEditingController();
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('分享位置'),),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: startController,
                    decoration: InputDecoration(
                      hintText: '开始时间',
                      icon: Icon(Icons.timer),
                    ),
                    onTap: () async {
                      var result = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2021),
                      );
                      print('$result');

                      TimeOfDay time = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now(),
                      );
                      print(time.minute);
                    },
                  ),
                ),
                Text('-'),
                Expanded(
                  child: TextField(
                    controller: startController,
                    decoration: InputDecoration(
                      hintText: '结束时间',
                      icon: Icon(Icons.timer),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: FLLoadingButton(
                child: Text('登陆'),
                minWidth: 250,
                color: Colors.blueAccent,
                loading: false,
                onPressed: () {

                },
              ),
            ),
            // FlatButton(
            //   color: Colors.blue,
              
            //   child: Text('分享'),
            //   onPressed: () {

            //   },
            // ),
          ],
        ),
      ),
    );
  }
}