require "formula"

class Kf5Kinit < Formula
  url "http://download.kde.org/stable/frameworks/5.11/kinit-5.11.0.tar.xz"
  sha1 "e9babb929e27419cc78b0b4936764616680bbf0c"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kinit.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5" => "with-d-bus"
  depends_on "haraldf/kf5/kf5-kio"

  def install
    args = std_cmake_args

    args << "-DCMAKE_CXX_FLAGS='-D_DARWIN_C_SOURCE'"

    system "cmake", ".", *args
    system "make", "install"

    mkdir_p "#{HOMEBREW_PREFIX}/lib/kde5/libexec"
    ln_sf "#{lib}/kde5/libexec/klauncher", "#{HOMEBREW_PREFIX}/lib/kde5/libexec/"

    prefix.install "install_manifest.txt"
  end
end
