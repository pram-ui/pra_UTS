import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Toko HP Online",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: Image(
                    image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Xiaomi_logo.svg/480px-Xiaomi_logo.svg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                // padding: new EdgeInsets.all(10.0),
                //
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(text: "Model HP"),
                      new Tab(text: "Spesifikasi HP"),
                      new Tab(text: "Harga HP"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView(
                children: <Widget>[
                  ListTile(
                    title: Text("Xiaomi Redmi Note 10"),
                  ),
                  ListTile(
                    title: Text("Xiaomi Poco M3 Pro 5G"),
                  ),
                  ListTile(
                    title: Text("Xiaomi Redmi 7A"),
                  ),
                  ListTile(
                    title: Text("Xiaomi Poco X3"),
                  ),
                  ListTile(
                    title: Text("Xiaomi Redmi 9"),
                  ),
                ],
              ),
              Center(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(10, (index) {
                    return Container(
                        child: Card(
                      color: Colors.deepPurpleAccent,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(),
                        child: ListView(
                          children: <Widget>[
                            ListTile(
                              title: Text("Xiaomi Note 10"),
                            ),
                            ListTile(
                              title: Text("Xiaomi Poco M3 Pro 5G"),
                            ),
                            ListTile(
                              title: Text("Xiaomi Redmi 7A"),
                            ),
                            ListTile(
                              title: Text("Xiaomi Poco X3"),
                            ),
                            ListTile(
                              title: Text("Xiaomi Redmi 9"),
                            ),
                          ],
                        ),
                      ),
                    ));
                  }),
                ),
              ),
              ListView(
                children: <Widget>[
                  ListTile(
                    title: Text("Xiaomi Note 10 - Rp.2 Juta"),
                  ),
                  ListTile(
                    title: Text("Xiaomi Poco M3 Pro 5G - Rp.3,1 Juta"),
                  ),
                  ListTile(
                    title: Text("Xiaomi Redmi 7A - Rp.1,5 Juta."),
                  ),
                  ListTile(
                    title: Text("Xiaomi Poco X3 - Rp.3,5 Juta"),
                  ),
                  ListTile(
                    title: Text("Xiaomi Redmi 9 - Rp.1,6 JUta"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;

  double get minExtent => _tabBar.preferredSize.height;
  double get maxExtent => _tabBar.preferredSize.height;

  Widget build(BuildContext context, double shrinkOffset, bool overlabsContents) {
    return new Container(
      child: _tabBar,
    );
  }

  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
