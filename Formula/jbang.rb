class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.118.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.118.0/jbang-0.118.0.zip"
  sha256 "689f7d974e6b6bfd7b29480ce5c87bcf6a3124fab33c15248566d6360835bee3"
  license "MIT"


  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/jbang", /^abs_jbang_dir=.*/, "abs_jbang_dir=#{libexec}/bin"
    bin.install_symlink "#{libexec}/bin/jbang"
  end

  test do
      system "#{bin}/jbang", "init", "-t", "cli", "hello.java"
      system "#{bin}/jbang", "hello.java", "Homebrew!"
  end
end
