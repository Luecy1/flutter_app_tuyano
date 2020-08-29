import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RSS',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: const Color(0xFFe91e63),
          accentColor: const Color(0xFFe91e63),
          canvasColor: const Color(0xFFfafafa)),
      home: RssListPage(),
    );
  }
}

class RssListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RSS'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: Rss.rssList.length,
          padding: EdgeInsets.all(10.0),
          itemBuilder: _buildRssItem,
        ),
      ),
    );
  }

  Widget _buildRssItem(BuildContext context, int index) {
    final rss = Rss.rssList[index];
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      title: Text(
        rss.name,
        style: TextStyle(fontSize: 24.0),
      ),
      onTap: () {
        final snackBar = SnackBar(content: Text('tap ${rss.name}'));
        Scaffold.of(context).showSnackBar(snackBar);
      },
    );
  }
}

class Rss {
  final String name;
  final String link;

  Rss(this.name, this.link);

  static List<Rss> get rssList {
    return [
      Rss('主要ニュース', 'https://news.yahoo.co.jp/pickup/rss.xml'),
      Rss('国際情勢', 'https://news.yahoo.co.jp/pickup/world/rss.xml'),
      Rss('国内の出来事', 'https://news.yahoo.co.jp/pickup/domestic/rss.xml'),
      Rss('IT関係', 'https://news.yahoo.co.jp/pickup/computer/rss.xml'),
    ];
  }
}
