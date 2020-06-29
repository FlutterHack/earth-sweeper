import 'package:earthsweeper/models/mine_point.dart';
import 'package:earthsweeper/widgets/mine_block.dart';
import 'package:flutter/cupertino.dart';

class MineBlockController {
  final MinePoint pointData;
  State _state;

  MineBlockController(this.pointData);

  bool _tabbed = false;
  bool _disabled = false;

  bool get tabbed => _tabbed;
  bool get disabled => _disabled;
  bool get opened => pointData.opened;
  bool get exploded => pointData.exploded;
  bool get flagged => pointData.flagged;
  bool get exposed => pointData.exposed;

  set opened(bool b) {
    _state.setState(() {
      pointData.opened = b;
    }); // Todo: implement change detection control to prevent needless ui updates
  }

  set tabbed(bool b) {
    if (!_disabled) {
      _state.setState(() {
        _tabbed = b;
      }); // Todo: implement change detection control to prevent needless ui updates
    }
  }

  set exploded(bool b) {
    _state.setState(() {
      pointData.exploded = b;
    }); // Todo: implement change detection control to prevent needless ui updates
  }

  set flagged(bool b) {
    _state.setState(() {
      pointData.flagged = b;
    }); // Todo: implement change detection control to prevent needless ui updates
  }

  set disabled(bool b) {
    _state.setState(() {
      _disabled = b;
    }); // Todo: implement change detection control to prevent needless ui updates
  }

  set exposed(bool b) {
    _state.setState(() {
      pointData.exposed = b;
    }); // Todo: implement change detection control to prevent needless ui updates
  }

  String get blockAsset {
    if (pointData.exploded && pointData.opened) {
      return "assets/tree_block/tree_exploded.png";
    } else if (pointData.mined && pointData.opened) {
      return "assets/tree_block/tree_opened.png";
    } else if (pointData.mined && pointData.exposed) {
      print("BLOCK ASSETS");
      return "assets/tree_block/tree_disabled.png";
    } else if (pointData.nearbyCount > 0 && pointData.opened) {
      return "assets/tree_block/${pointData.nearbyCount}.png";
    } else {
      return "assets/tree_block/0.png";
    }
  }

  void registerState(State state) {
    _state = state;
  }
}
