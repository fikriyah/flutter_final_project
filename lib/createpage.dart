import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_final_project/postspage.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key, required this.channel}) : super(key: key);
  final WebSocketChannel channel;

  State<StatefulWidget> createState() {
    return _CreatePageState(channel);
  }
}

class _CreatePageState extends State<CreatePage> {
  _CreatePageState(this.channel);
  WebSocketChannel channel;
  TextEditingController title = new TextEditingController();
  TextEditingController decription = new TextEditingController();
  TextEditingController image = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Whatever'),
        backgroundColor: Colors.red[400],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 0.8,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(8.0),
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text('Title'),
                  ),
                  Container(
                    child: TextFormField(
                      controller: title,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Title",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text('Description'),
                  ),
                  Container(
                    child: TextFormField(
                      controller: decription,
                      maxLength: 1000,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      scrollPadding: EdgeInsets.only(left: 8, top: 10),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Description",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text('Image URL'),
                  ),
                  Container(
                    child: TextFormField(
                      controller: image,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Insert image URL",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red[400],
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PostsPage(
                      channel: channel,
                    ),
                  ),
                );
              },
              child: Text(
                'CREATE POST',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
