require "formula"

class Kf5Ki18n < Formula
  url "http://download.kde.org/stable/frameworks/5.11/ki18n-5.11.0.tar.xz"
  sha1 "0c4751ebc1f3c488f3e95622acf9311e367b7402"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/ki18n.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "gettext" => :build
  depends_on "qt5" => "with-d-bus"

  def install
    args = std_cmake_args

    args << "-DCMAKE_SHARED_LINKER_FLAGS=-lintl" # cmake thinks libintl is part of libc
    args << "-DCMAKE_EXE_LINKER_FLAGS=-lintl"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
