import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          foregroundColor: Colors.black,
                          backgroundImage: AssetImage('asset/image/icons1.png'),
                          radius: 45,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Movie Pro",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                )),
            new ListTile(
              leading: Icon(Icons.home),
              title: const Text("Home"),
              onTap: null,
            ),
            new ListTile(
              leading: Icon(Icons.play_circle_outline_sharp),
              title: Text("Now Playing"),
            ),
            new ListTile(
              leading: Icon(Icons.arrow_upward),
              title: Text("Top rated"),
            ),
            new ListTile(
              leading: Icon(Icons.live_tv_sharp),
              title: Text("Upcoming"),
            ),
            new Divider(),
            new ListTile(
              leading: Icon(Icons.question_mark_sharp),
              title: Text("About"),
            ),
          ],
        ),
      ),
      body: new Center(
        child: Container(),
      ),
    );
  }
}
