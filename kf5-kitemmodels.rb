require "formula"

class Kf5Kitemmodels < Formula
  url "http://download.kde.org/stable/frameworks/5.14/kitemmodels-5.14.0.tar.xz"
  sha1 "38f23be0fd9b2a3a220ac39cdc418518c48655af"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kitemmodels.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
