import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

enum HomeState { Initial, Loading, Loaded, Error }

class HomeModel extends ChangeNotifier {
  final picker = ImagePicker();

  List<File> imagesFile = [];
  final _pdf = pw.Document();

  HomeState _homeState = HomeState.Initial;

  int index = 0;
  HomeState get homeState => _homeState;

  Future<void> handleChoosePhoto(BuildContext context) async {
    try {
      _homeState = HomeState.Loading;
      notifyListeners();
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      imagesFile.add(File(pickedFile.path));
      _homeState = HomeState.Loaded;

      notifyListeners();
    } catch (e) {
      _homeState = HomeState.Error;
    }
  }

  Future<void> convertImagesFileToPDF() async {
    _homeState = HomeState.Loading;
    notifyListeners();
    try {
      for (var index = 0; index < imagesFile.length; index++) {
        final image = pw.MemoryImage(imagesFile[index].readAsBytesSync());

        _pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (pw.Context context) {
              return pw.Center(
                child: pw.Image(image),
              ); // Center
            },
          ),
        );

        final output = await getExternalStorageDirectory();
        print("${output.path}/example.pdf");
        final file = File("${output.path}/document${DateTime.now()}.pdf");
        await file.writeAsBytes(await _pdf.save());
        _homeState = HomeState.Loaded;
        notifyListeners();
      }
    } catch (e) {
      _homeState = HomeState.Error;
      notifyListeners();
    }
  }

  Future<void> convertImagesFileToSinglePDFfile() async {
    List<pw.MemoryImage> images = [];
    for (var index = 0; index < imagesFile.length; index++) {
      final image = pw.MemoryImage(imagesFile[index].readAsBytesSync());
      images.add(image);
    }
    print(images.length);

    _pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.ListView.builder(
            itemCount: images.length,
            itemBuilder: (pw.Context context, int index) {
              return pw.Padding(
                  padding: const pw.EdgeInsets.all(18),
                  child: pw.Image(images[index]));
            },
          );
        },
      ),
    );

    final output = await getExternalStorageDirectory();
    final file = File("${output.path}/long_document${DateTime.now()}.pdf");
    await file.writeAsBytes(await _pdf.save());
    print('Done');
  }
}
