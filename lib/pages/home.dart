import 'package:flutter/material.dart';
import 'package:projectappbar/component/home/sliver_delegate.dart';
import 'package:projectappbar/pages/songs.dart';
import 'package:projectappbar/pages/album.dart';
import 'package:projectappbar/pages/gallery.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: 3,
            initialIndex: 1,
            child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 200.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text('Belajar SliverAppBar', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                        background: Image(
                          image: AssetImage('assets/images/bg.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                        pinned: true,
                        delegate: SliverAppBarDelegate(TabBar(labelColor: Colors.black87, unselectedLabelColor: Colors.grey, tabs: [
                          Tab(icon: const Icon(Icons.audiotrack), text: "Songs"),
                          Tab(icon: const Icon(Icons.album), text: "Album"),
                          Tab(icon: const Icon(Icons.collections), text: "Gallery"),
                        ])))
                  ];
                },
                body: TabBarView(
                  children: <Widget>[
                    SongsPage(),
                    AlbumPage(),
                    GalleryPage(),
                  ],
                ))));
  }
}
