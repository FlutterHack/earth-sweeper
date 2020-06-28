class MinePoint {
  final int x;
  final int y;

  String mineAsset;
  int nearbyCount = 0;

  bool opened = true; // Test value // TODO: replace with false
  bool flagged = false;
  bool mined = false;
  bool exploded = false;
  bool exposed = false;

  MinePoint(this.x, this.y, {this.opened = true, this.flagged = false, this.mined = false});

  void increaseNearbyCount(){
    if(!mined)
      nearbyCount++;
  }
}