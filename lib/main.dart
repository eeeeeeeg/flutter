import 'package:flutter/material.dart';
import 'widget/tip_route.dart';
import 'widget/word_page.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        initialRoute: "/", //名为"/"的路由作为应用的home(首页)
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "new_page": (context) => TipRoute(text: '我是入参'), //命名路由静态传参
          "/": (context) => MyHomePage(title: '我是主页'),
          "tip2": (context) {
            return TipRoute(text: ModalRoute.of(context).settings.arguments);
          }, //配置命名路由动态传参
        }, //命名路由位置 MaterialApp里面的属性
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            String routeName = settings.name;
            print(settings.name);
            Navigator.pushNamed(context, routeName);
            // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
            // 引导用户登录；其它情况则正常打开路由。
          });
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            new FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () async {
                //导航到新路由
                var result = await Navigator.of(context)
                    .pushNamed("tip2", arguments: "hi");
                if (null == result) {
                  _incrementCounter();
                } else {
                  _incrementCounter();
                  _incrementCounter();
                  _incrementCounter();
                  _incrementCounter();
                  _incrementCounter();
                }
              },
            ),
            new FlatButton(
              child: Text("handle Get Random World"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WordRoute();
                }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
