import 'package:sentry/sentry.dart';

SentryClient _sentry;

SentryClient setupCrashReporting() {
  _sentry = new SentryClient(
      dsn: 'https://013e482ea83f40048e96647edad32601@sentry.io/1506338');
  return _sentry;
}

void report(dynamic error) {
  print(error);
  try {
    _sentry
        .capture(event: error)
        .catchError((e) => print('Could not report error to Sentry: $e'));
  } catch (e) {
    print(e);
  }
}
