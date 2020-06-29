class MinePoint {
  final int x;
  final int y;

  String mineAsset;
  int nearbyCount = 0;

  bool opened = false;
  bool flagged = false;
  bool mined = false;
  bool exploded = false;
  bool exposed = false;

  MinePoint(this.x, this.y,
      {this.opened = false,
      this.flagged = false,
      this.mined = false,
      this.exposed = false});

  void increaseNearbyCount() {
    if (!mined) nearbyCount++;
  }
}
