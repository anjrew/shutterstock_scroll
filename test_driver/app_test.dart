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

    test('Check flutter driver health', () async {
        Health health = await driver.checkHealth();
        print(health.status);
    });

 
    test('Find and click on image', () async {

		print('Trying to find mainApp');
		await driver.waitFor(find.byValueKey("mainApp"));
        print("Found mainApp");
		
		print('Trying to find gallery list');
		await driver.waitFor(find.byValueKey("GalleryList"));
        print("Found GalleryList");

		print('Trying to find mainAppBar');
		await driver.waitFor(find.byValueKey("mainAppBar"));
        print("Found mainAppBar");
		
		print('Trying to find image list');
        await driver.waitFor(find.byValueKey("257290"));
		print('Image found');

		print('Tapping on image');
        await driver.tap(find.byValueKey("257290"));
        print("Tapped on image");
		
		print('Trying to find imageViewTitle');
        await driver.waitFor(find.byValueKey('imageViewTitle'));
		print('imageViewTitle found');

    });
}