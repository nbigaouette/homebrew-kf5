require "formula"

class Kf5Kjobwidgets < Formula
  url "http://download.kde.org/stable/frameworks/5.11/kjobwidgets-5.11.0.tar.xz"
  sha1 "2953b5b98a340cb023a601e400663159c89867c8"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kjobwidgets.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "haraldf/kf5/kf5-kcoreaddons"
  depends_on "haraldf/kf5/kf5-kwidgetsaddons"
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
