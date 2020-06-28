class MinePoint {
  String mineAsset;
  bool isMined;
  int nearbyCount;
  int x;
  int y;

  bool opened;
  bool flagged;
  bool mined;

  MinePoint(this.x, this.y, this.mineAsset, this.isMined, this.nearbyCount,
      {this.opened = false, this.flagged = false, this.mined});
}