class Riggurly < Formula
  desc "Terminal-based Game Boy emulator"
  homepage "https://codeberg.org/KaonQuantum/riggurly"
  url "https://codeberg.org/KaonQuantum/riggurly/archive/v0.1.0.tar.gz"
  sha256 "233cb5849b6231d20547916eeee41d9c80ad3daf2368349fc0724a55dd017282"
  license "MIT"
  head "https://codeberg.org/KaonQuantum/riggurly.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build

  on_linux do
    depends_on "alsa-lib"
  end

  def install
    system "cargo", "install", *std_cargo_args, "--target-dir", "target"

    (man1/"riggurly.1").write Utils.safe_popen_read(bin/"riggurly", "--generate-helpers", "man")

    generate_completions_from_executable(bin/"riggurly", "--generate-helpers")
  end

  test do
    system bin/"riggurly", "--version"
  end
end
