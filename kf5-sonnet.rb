require "formula"

class Kf5Sonnet < Formula
  url "http://download.kde.org/stable/frameworks/5.11/sonnet-5.11.0.tar.xz"
  sha1 "3b2b55e0645e477abe041c2a70d49ecfa0263b84"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/sonnet.git'

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
