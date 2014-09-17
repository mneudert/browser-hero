import 'dart:io';
import 'package:logging/logging.dart';
import 'package:start/start.dart';

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  final Logger log = new Logger('BrowserHero');

  start(port: 8080).then((Server app) {
    app.static('build/web');

    app.get('/log/highscore/:name/:score').listen((request) {
      log.fine('Highscore for "${ request.param('name') }": ${ request.param('score') }');

      request.response
        .status(HttpStatus.NO_CONTENT)
        .close();
    });
  });
}
