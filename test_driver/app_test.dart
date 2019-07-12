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
                        
        // await driver.waitFor(find.byValueKey("mainAppBar"));
        // print("Found app bar");
        await driver.waitFor(find.byType("GalleryList"));
        print("Found GalleryList");
        await driver.waitFor(find.byValueKey("257290"));
        await driver.tap(find.byValueKey("257290"));
        print("Found the square image");
        await driver.waitFor(find.byValueKey('imageViewTitle'));
    });
}