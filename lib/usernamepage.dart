import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_final_project/postspage.dart';
import 'package:web_socket_channel/io.dart';

final channel = IOWebSocketChannel.connect('ws://besquare-demo.herokuapp.com');
Stream streamChannel = channel.stream.asBroadcastStream();

class UsernamePage extends StatefulWidget {
  const UsernamePage({Key? key}) : super(key: key);

  @override
  _UsernamePageState createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  late TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Container(),
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    padding: EdgeInsets.all(30.0),
                    margin: EdgeInsets.all(15.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ]),
                    child: Form(
                      //key: globalFormKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            child: Image.asset('assets/besquare_logo.png'),
                          ),
                          SizedBox(height: 20),
                          new TextFormField(
                            controller: controller,
                            keyboardType: TextInputType.text,
                            //onSaved: (input) => requestModel.username = input!,
                            decoration: new InputDecoration(
                                hintText: "Username",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.account_circle_outlined,
                                    color: Theme.of(context).accentColor)),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            child: Text(
                              "ENTER TO THE APP",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).accentColor,
                            ),
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PostsPage(
                                      channel: channel,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
