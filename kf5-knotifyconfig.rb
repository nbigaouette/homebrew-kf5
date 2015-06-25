require "formula"

class Kf5Knotifyconfig < Formula
  url "http://download.kde.org/stable/frameworks/5.11/knotifyconfig-5.11.0.tar.xz"
  sha1 "17e8571d7af1112b6ef6c708944014b7aeb02c25"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/knotifyconfig.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "haraldf/kf5/kf5-kio"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
