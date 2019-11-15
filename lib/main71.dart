import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlterExample(),
    );
  }
}

class AlterExample extends StatefulWidget {
  @override
  _AlterExampleState createState() => _AlterExampleState();
}

class _AlterExampleState extends State<AlterExample> {
  bool withTree = false; // 复选框选中状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('复选框弹窗，此时的复选框无法选中。'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text("对话框2"),
              onPressed: () async {
                bool delete = await showDeleteConfirmDialog2();
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录: $delete");
                }
              },
            ),

            RaisedButton(
              child: Text("话框3（复选框可点击）"),
              onPressed: () async {
                //弹出删除确认对话框，等待用户确认
                bool deleteTree = await showDeleteConfirmDialog3();
                if (deleteTree == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录: $deleteTree");
                }
              },
            ),


            RaisedButton(
              child: Text("话框4（复选框可点击）"),
              onPressed: () async {
                //弹出删除确认对话框，等待用户确认
                bool deleteTree = await showDeleteConfirmDialog4();
                if (deleteTree == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录: $deleteTree");
                }
              },
            ),

            RaisedButton(
              child: Text("话框5（复选框可点击）"),
              onPressed: () async {
                //弹出删除确认对话框，等待用户确认
                bool deleteTree = await showDeleteConfirmDialog5();
                if (deleteTree == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录: $deleteTree");
                }
              },
            ),


          ],
        ),
      ),
    );
  }

  Future<bool> showDeleteConfirmDialog2() {
    withTree = false; // 默认复选框不选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  Checkbox(
                    value: withTree,
                    onChanged: (bool value) {
                      //复选框选中状态发生变化时重新构建UI
                      setState(() {
                        //更新复选框状态
                        withTree = !withTree;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(withTree);
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> showDeleteConfirmDialog3() {
    bool _withTree = false; //记录复选框是否选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  DialogCheckbox(
                    value: _withTree, //默认不选中
                    onChanged: (bool value) {
                      //更新选中状态
                      _withTree = !_withTree;
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> showDeleteConfirmDialog4() {
    bool _withTree = false; //记录复选框是否选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),



//                  DialogCheckbox(
//                    value: _withTree, //默认不选中
//                    onChanged: (bool value) {
//                      //更新选中状态
//                      _withTree = !_withTree;
//                    },
//                  ),

                  StatefulBuilder(
                    builder: (context, _setState) {
                      return Checkbox(
                        value: _withTree, //默认不选中
                        onChanged: (bool value) {
                          //_setState方法实际就是该StatefulWidget的setState方法，
                          //调用后builder方法会重新被调用
                          _setState(() {
                            //更新选中状态
                            _withTree = !_withTree;
                          });
                        },
                      );
                    },
                  ),






                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }


  Future<bool> showDeleteConfirmDialog5() {
    bool _withTree = false; //记录复选框是否选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),



//                  DialogCheckbox(
//                    value: _withTree, //默认不选中
//                    onChanged: (bool value) {
//                      //更新选中状态
//                      _withTree = !_withTree;
//                    },
//                  ),

//                  StatefulBuilder(
//                    builder: (context, _setState) {
//                      return Checkbox(
//                        value: _withTree, //默认不选中
//                        onChanged: (bool value) {
//                          //_setState方法实际就是该StatefulWidget的setState方法，
//                          //调用后builder方法会重新被调用
//                          _setState(() {
//                            //更新选中状态
//                            _withTree = !_withTree;
//                          });
//                        },
//                      );
//                    },
//                  ),

                    Checkbox( // 依然使用Checkbox组件
                      value: _withTree,
                      onChanged: (bool value) {
                        // 此时context为对话框UI的根Element，我们
                        // 直接将对话框UI对应的Element标记为dirty
                        (context as Element).markNeedsBuild();
                        _withTree = !_withTree;
                      },
                    ),

                    // 通过Builder来获得构建Checkbox的`context`，
                    // 这是一种常用的缩小`context`范围的方式
                    // 这样只会刷新CheckBox
                    Builder(builder:(BuildContext context){
                      return Checkbox( // 依然使用Checkbox组件
                        value: _withTree,
                        onChanged: (bool value) {
                          // 此时context为对话框UI的根Element，我们
                          // 直接将对话框UI对应的Element标记为dirty
                          (context as Element).markNeedsBuild();
                          _withTree = !_withTree;
                        },
                      );
                    }),

                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }
}

// 单独封装一个内部管理选中状态的复选框组件
class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({
    Key key,
    this.value,
    @required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        //将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          //更新自身选中状态
          value = v;
        });
      },
    );
  }
}