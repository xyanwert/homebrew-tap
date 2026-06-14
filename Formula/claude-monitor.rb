class ClaudeMonitor < Formula
  include Language::Python::Shebang

  desc "Pixel-animated Claude usage monitor: doom-fire, tokenfall, invaders, cube"
  homepage "https://github.com/xyanwert/usage-monitor"
  url "https://github.com/xyanwert/usage-monitor/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "52c73189fe74b1c7fbe909f3443c48ce9d9a16f7cb1797e2cb7203d48c267d60"
  license "MIT"
  head "https://github.com/xyanwert/usage-monitor.git", branch: "main"

  depends_on "python@3.13"
  depends_on "tmux"

  def install
    rewrite_shebang detected_python_shebang, "claude_monitor.py"
    bin.install "claude_monitor.py" => "claude-monitor"
  end

  def caveats
    <<~EOS
      Reads your logged-in Claude Code credentials (Keychain on macOS).
      Apple's Terminal.app lacks truecolor — use iTerm2, Ghostty, kitty, or WezTerm.
      Split-screen dock:  claude-monitor side claude
    EOS
  end

  test do
    assert_match "Burnout", shell_output("#{bin}/claude-monitor --help")
  end
end
