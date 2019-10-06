import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_player_clone/song.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Best of Hindi',
          ),
        )),
    body: SpotifyPlayer(),
  )));
}

class SpotifyPlayer extends StatefulWidget {
  @override
  _SpotifyPlayerState createState() => _SpotifyPlayerState();
}

class _SpotifyPlayerState extends State<SpotifyPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  Song dummySong = Song(
      'Duniyaa',
      'https://p.scdn.co/mp3-preview/4efd033217aa13f4625d37f95efa676fb02d4778?cid=774b29d4f13844c495f206cafdad9c86',
      'https://i.scdn.co/image/f218335b215402cc2fb3b8d92652ebad48458805',
      'Luka Chuppi');
  List<Song> allSongs =
      SongData().songs; // You are given a list of songs here for Stretch
  int i = 0;
  IconData playpausebutton = Icons.play_circle_filled;

  void button() {
    if (playpausebutton == Icons.play_circle_filled) {
      audioPlayer.play(allSongs[i].playUrl);
      playpausebutton = Icons.pause_circle_filled;
    } else if (playpausebutton == Icons.pause_circle_filled) {
      audioPlayer.pause();
      playpausebutton = Icons.play_circle_filled;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Image(
              image: NetworkImage(allSongs[i].imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            child: Text(
              allSongs[i].name,
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontFamily: 'Lobster'),
            ),
            alignment: Alignment.bottomLeft,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            child: Text(
              allSongs[i].artistName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Lobster'),
            ),
            alignment: Alignment.bottomLeft,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.thumb_up),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.skip_previous),
                iconSize: 40,
                color: Colors.white,
                onPressed: () {
                  if (i > 0) {
                    i--;
                    audioPlayer.play(allSongs[i].playUrl);
                  } else if (i == 0) {
                    i = allSongs.length - 1;
                    audioPlayer.play(allSongs[i].playUrl);
                  }
                },
              ),
              IconButton(
                // icon: Icon(Icons.play_circle_filled),
                color: Colors.white, iconSize: 55,
                icon: Icon(playpausebutton),
                onPressed: button,
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                color: Colors.white,
                iconSize: 40,
                onPressed: () {
                  if (i < allSongs.length) {
                    i++;
                    audioPlayer.play(allSongs[i].playUrl);
                  } else {
                    i = 0;
                    audioPlayer.play(allSongs[i].playUrl);
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.thumb_down),
                iconSize: 30,
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
