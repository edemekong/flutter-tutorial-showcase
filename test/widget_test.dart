// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_tutorials/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

// Future<void> convertImagesFileToPDF() async {
//     _homeState = HomeState.Loading;
//     notifyListeners();
//     for (int index = 0; index < imagesFile.length; index++) {
//       final image = pw.MemoryImage(imagesFile[index].readAsBytesSync());

//       _pdf.addPage(
//         pw.Page(
//           pageFormat: PdfPageFormat.a4,
//           build: (pw.Context context) {
//             return pw.AspectRatio(
//                 aspectRatio: 1.9,
//                 child: pw.Container(
//                   decoration: pw.BoxDecoration(image: pw.DecorationImage(image: pw.MemoryImage(image.bytes))),
//                   // child: pw.Image(image),
//                 )); // Center
//           },
//         ),
//       );

//       final output = await getExternalStorageDirectory();
//       print("${output.path}/example.pdf");
//       final file = File("${output.path}/document${DateTime.now()}.pdf");
//       await file.writeAsBytes(await _pdf.save());
//       _homeState = HomeState.Loaded;
//       notifyListeners();
//     }
//   }
