require "formula"

class Kf5Kross < Formula
  url "http://download.kde.org/stable/frameworks/5.11/portingAids/kross-5.11.0.tar.xz"
  sha1 "3133fe4eccb5754b2d7997f651b66ca8b94e5920"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kross.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "haraldf/kf5/kf5-kdoctools" => :build
  depends_on "haraldf/kf5/kf5-kparts"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
