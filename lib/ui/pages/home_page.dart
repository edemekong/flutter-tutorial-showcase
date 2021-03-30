import 'package:flutter/material.dart';
import 'package:flutter_tutorials/view_models/home_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Consumer<HomeModel>(
      builder: (_, state, child) => Scaffold(
        appBar: AppBar(
          title: Text('Multiple Images to Pdf'),
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                itemCount: state.imagesFile.length + 1,
                itemBuilder: (_, index) {
                  if (state.imagesFile.length == index) {
                    return InkWell(
                      onTap: () => state.handleChoosePhoto(context),
                      child: Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(Icons.add, size: 30),
                        ),
                      ),
                    );
                  }
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(state.imagesFile[index]),
                    )),
                  );
                },
              ),
            ),
            state.homeState == HomeState.Loading ? Center(child: CircularProgressIndicator()) : SizedBox(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () => state.convertImagesFileToSinglePDFfile(),
        ),
      ),
    );
  }
}
