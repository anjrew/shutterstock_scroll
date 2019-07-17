import 'package:sentry/sentry.dart';


SentryClient _sentry;

SentryClient setupCrashReporting(){
	_sentry = new SentryClient(dsn: 'https://013e482ea83f40048e96647edad32601@sentry.io/1506338');
	return _sentry;
}

void report(dynamic error){
	try {
		_sentry.captureException(
		exception: error,
		stackTrace: error.stackTrance)
		.catchError((e) => print('Could not report error to Sentry: $e'));
	} catch (e) {
		print(e);
	}
	
}