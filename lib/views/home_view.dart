import 'package:flutter/material.dart';
import 'package:flutter_tutorials/view_models/home_view_models.dart';
import 'package:provider/provider.dart';







class HomeViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(onPressed: (){
            model.changeState(HomeState.LoadedState);
          }, child: Text('Loaded State')),
          FlatButton(onPressed: (){
            model.changeState(HomeState.LoadingState);

          }, child: Text('Loading State')),
          FlatButton(onPressed: (){
            model.changeState(HomeState.ErrorState);

          }, child: Text('Error State')),
        ],
      ),
      body: _buildBody(model.homeState),
    );
  }


  _buildBody(HomeState state){
    switch(state){
      case HomeState.LoadedState:
        return LoadedPage();
        break;
      case HomeState.LoadingState:
        return Center(child: CircularProgressIndicator(),);
        break;
      case HomeState.ErrorState:
        return Center(child: Text('Some Errors'),);
        break;
    }
  }
}

class LoadedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, i)=> ListTile(
      title: Text('Paulvin'),
      subtitle: Text('09373463541'),
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(Icons.person),
      ),
    ));
  }

}
