class Riggurly < Formula
  desc "A terminal-based medium-high accuracy game boy emulator"
  homepage "https://codeberg.org/KaonQuantum/riggurly"
  url ""
  sha256 ""
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args, "--target-dir", "target"

    man1.install Dir["target/release/build/riggurly-*/out/riggurly.1"].first

    generate_completions_from_executable(bin/"riggurly", "--generate-completions")
  end

  test do
    system bin/"riggurly", "--version"
  end
end
