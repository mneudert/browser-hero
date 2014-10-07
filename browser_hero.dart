import 'dart:convert';
import 'dart:io';
import 'package:cargo/cargo_server.dart';
import 'package:rikulo_commons/io.dart';
import 'package:stream/stream.dart';

final Cargo storage = new Cargo(MODE: CargoMode.FILE, path: "./storage/");

final homeDir = 'build/web';
final uriMapping = {
  'get:/api/highscore': apiHighscoreGet,
  'post:/api/highscore': apiHighscorePost,
};

void apiHighscoreGet(HttpConnect connect) {
  storage
    .getItem('highscores', defaultValue: new List())
    .then((highscores) {
      connect.response
        ..headers.contentType = getContentType('json')
        ..write(JSON.encode(highscores));
  });
}

void apiHighscorePost(HttpConnect connect) {
  connect.response.statusCode = HttpStatus.NO_CONTENT;

  HttpUtil
    .decodePostedParameters(connect.request)
    .then((Map<String, String> scoring) {
      connect.server.logger.info('Highscore for "${ scoring['nickname'] }": ${ scoring['score'] }');

      storage
        .getItem('highscores', defaultValue: new List())
        .then((highscores) {
          highscores.add(scoring);
          storage.setItem('highscores', highscores);
      });
  });
}

void main() {
  new StreamServer(uriMapping: uriMapping, homeDir: homeDir)
    .start(port: 8080);
}
