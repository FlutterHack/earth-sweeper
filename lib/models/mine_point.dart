class MinePoint {
  final String mineAsset;
  final bool isMined;
  final int nearbyCount;
  final int x;
  final int y;

  MinePoint(this.x, this.y, this.mineAsset, this.isMined, this.nearbyCount);
}