import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
 
void main() {
    
    FlutterDriver driver;

    setUpAll(() async {
            driver =  await FlutterDriver.connect();
    });

    tearDownAll(() async {
        
        if (driver != null) {     
            await driver.close();
        }
    });

    test('check flutter driver health', () async {
        Health health = await driver.checkHealth();
        print(health.status);
    });

 
    test('Find and click on image', () async {
        SerializableFinder squareImage = find.byType('SquareImage'); 
        await driver.waitFor(squareImage);
        await driver.tap(find.byType('SquareImage'));
        
    });
}