import 'package:earthsweeper/models/mine_point.dart';
import 'package:earthsweeper/widgets/mine_block.dart';
import 'package:flutter/cupertino.dart';

class MineBlockProvider with ChangeNotifier{
  final MinePoint pointData;

  MineBlockProvider(this.pointData);

  bool _tabbed = false;

  bool get tabbed => _tabbed;
  bool get opened => pointData.opened;
  bool get exploded => pointData.exploded;
  bool get flagged => pointData.flagged;

  set opened(bool b){
    pointData.opened = b;
    notifyListeners();  // Todo: implement change detection control to prevent needless ui updates
  }

  set tabbed(bool b){
    _tabbed = b;
    notifyListeners();  // Todo: implement change detection control to prevent needless ui updates
  }

  set exploded(bool b){
    pointData.exploded = b;
    notifyListeners();  // Todo: implement change detection control to prevent needless ui updates
  }

  set flagged(bool b){
    pointData.flagged = b;
    notifyListeners();  // Todo: implement change detection control to prevent needless ui updates
  }

  String get blockAsset{
    if(pointData.mined && pointData.opened){
      return "assets/mine_block/mine_exposed.jpg";
    }
    if(pointData.exploded && pointData.opened){
      return "assets/mine_block/mine_exploded.jpg";
    }
    if(pointData.nearbyCount > 0 && pointData.opened){
      return "assets/mine_block/${pointData.nearbyCount}.jpg";
    }
    else{
      return "assets/mine_block/0.jpg";
    }
  }

  void clicked(){

  }

  void openBlock(){
    notifyListeners();
  }
}
