require "formula"

class Kf5Kxmlgui < Formula
  url "http://download.kde.org/stable/frameworks/5.11/kxmlgui-5.11.0.tar.xz"
  sha1 "041dbdd846183691e3067d98fa4826478a70ccd4"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kxmlgui.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "haraldf/kf5/kf5-kglobalaccel"
  depends_on "haraldf/kf5/kf5-ktextwidgets"
  depends_on "haraldf/kf5/kf5-attica"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
