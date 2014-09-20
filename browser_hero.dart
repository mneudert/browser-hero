import 'dart:io';
import 'package:logging/logging.dart';
import 'package:cargo/cargo_server.dart';
import 'package:start/start.dart';

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  final Logger log = new Logger('BrowserHero');
  final Cargo storage = new Cargo(MODE: CargoMode.FILE, path: "./storage/");

  storage.start();

  start(port: 8080).then((Server app) {
    app.static('build/web');

    app.get('/api/highscore').listen((request) {
      storage
        .getItem('highscores', defaultValue: new List())
        .then((highscores) { request.response.json(highscores); });
    });

    app.post('/api/highscore').listen((request) {
      request.payload().then((scoring) {
        log.fine('Highscore for "${ scoring['nickname'] }": ${ scoring['score'] }');

        storage
          .getItem('highscores', defaultValue: new List())
          .then((highscores) {
            highscores.add(scoring);
            storage.setItem('highscores', highscores);
        });
      });

      request.response
        .status(HttpStatus.NO_CONTENT)
        .close();
    });
  });
}
