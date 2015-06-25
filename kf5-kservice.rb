require "formula"

class Kf5Kservice < Formula
  url "http://download.kde.org/stable/frameworks/5.11/kservice-5.11.0.tar.xz"
  sha1 "cfefce85aa61461c55be64de7bac5f3f3bed654a"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kservice.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "haraldf/kf5/kf5-kcrash"
  depends_on "haraldf/kf5/kf5-kdoctools"
  depends_on "haraldf/kf5/kf5-kdbusaddons"
  depends_on "haraldf/kf5/kf5-kconfig"
  depends_on "haraldf/kf5/kf5-ki18n"

  def install
    args = std_cmake_args


    system "cmake", ".", "-DBUILD_TESTING=OFF", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
