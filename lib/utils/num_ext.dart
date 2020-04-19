// 像素适配
extension NumExt on num {
  static double rpx = 1;
// px
  num adapter() {
    return this * rpx;
  }
}
