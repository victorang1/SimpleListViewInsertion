import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> listName = [];
  final btnController = TextEditingController();

  @override
  void dispose() {
    btnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List People'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: btnController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter person name',
                  contentPadding: const EdgeInsets.all(8.0)),
            ),
            FlatButton(
              onPressed: () {
                btnController.text = btnController.text.trim();
                if (btnController.text.isNotEmpty) {
                  listName.add(btnController.text);
                }
                btnController.clear();
                setState(() {});
              },
              child: Text('Add Person'),
            ),
            Expanded(
              child: _myListView(context, listName),
            )
          ],
        ),
      ),
    );
  }
}

Widget _myListView(BuildContext context, List<String> list) {
  return ListView.separated(
    separatorBuilder: (context, index) => Divider(
      color: Colors.black,
    ),
    itemCount: list.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.person),
        title: Text(list[index]),
      );
    },
  );
}