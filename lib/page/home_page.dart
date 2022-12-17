// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_drawer/page/popular_movie.dart';
import 'package:movie_drawer/page/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<PopularMovies> popularMovies = [];
  Repository repository = Repository();

  getData() async {
    final listMovie = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                )),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => HomePage,
            ),
            ListTile(
              leading: Icon(Icons.play_circle_outline_sharp),
              title: Text("Now Playing"),
              onTap: null,
            ),
            const ListTile(
              leading: Icon(Icons.arrow_upward),
              title: Text("Top rated"),
              onTap: null,
            ),
            const ListTile(
              leading: Icon(Icons.live_tv_sharp),
              title: Text("Upcoming"),
              onTap: null,
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.question_mark_sharp),
              title: Text("About"),
              onTap: null,
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print("Has Data: ${snapshot.hasData}");
            return ListView.builder(
              itemCount: snapshot.data.results.length,
              itemBuilder: (BuildContext context, int index) {
                var imageBaseUrl;
                var MovieDetail;
                return moviesItem(
                    poster:
                        '$imageBaseUrl${snapshot.data.results[index].posterPath}',
                    title: '${snapshot.data.results[index].title}',
                    date: '${snapshot.data.results[index].releaseDate}',
                    voteAverage: '${snapshot.data.results[index].voteAverage}',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetail(
                                movie: snapshot.data.results[index],
                              )));
                    });
              },
            );
          } else if (snapshot.hasError) {
            print("Has Error: ${snapshot.hasError}");
            return Text('Error!!!');
          } else {
            print("Loading...");
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget moviesItem(
      {required String poster,
      required String title,
      required String date,
      required String voteAverage,
      required Function onTap}) {
    return InkWell(
      onTap: onTap(),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Card(
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 120,
                  child: CachedNetworkImage(
                    imageUrl: poster,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.calendar_today,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(date),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.star,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(voteAverage),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
