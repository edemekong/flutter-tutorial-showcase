import 'package:flutter/material.dart';
import 'package:flutter_tutorials/models/place.dart';
import 'package:flutter_tutorials/services/location_api.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchInjector(
        child: SafeArea(
          child: Consumer<LocationApi>(
            builder: (_, api, child) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        controller: api.addressController,
                        decoration:
                            InputDecoration(labelText: 'Search Location'),
                        onChanged: api.handleSearch,
                      ),
                    ),
                    Container(
                      color: Colors.blue[100].withOpacity(.3),
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: StreamBuilder<List<Place>>(
                          stream: api.controllerOut,
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return Center(
                                  child: Text('No data address found'));
                            }
                            final data = snapshot.data;
                            return Scrollbar(
                              controller: _scrollController,
                              child: SingleChildScrollView(
                                controller: _scrollController,
                                child: Container(
                                  child: Builder(builder: (context) {
                                    return Column(
                                        children:
                                            List.generate(data.length, (index) {
                                      final place = data[index];
                                      return ListTile(
                                        onTap: () {
                                          api.addressController.text =
                                              '${place.name}, ${place.street}, ${place.country}';
                                        },
                                        title: Text(
                                            '${place.name}, ${place.street}'),
                                        subtitle: Text('${place.country}'),
                                      );
                                    }));
                                  }),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchInjector extends StatelessWidget {
  final Widget child;

  const SearchInjector({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocationApi(),
      child: child,
    );
  }
}
