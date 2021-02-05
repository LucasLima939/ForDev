import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:for_dev/main/main.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4dev'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


void main(){

  Future<void> loadPage(WidgetTester tester) async {
    await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: ()=> SplashPage())
          ],
        )
    );
  }

  testWidgets('Should presenter spinner on page load', (WidgetTester tester) async{
    await loadPage(tester);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}