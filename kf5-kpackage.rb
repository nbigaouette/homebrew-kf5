require "formula"

class Kf5Kpackage < Formula
  url "http://download.kde.org/stable/frameworks/5.11/kpackage-5.11.0.tar.xz"
  sha1 "151aa58865b12d016ad78c7bd0567e2cd02403dd"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kpackage.git'

  depends_on "cmake" => :build
  depends_on "gettext" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
