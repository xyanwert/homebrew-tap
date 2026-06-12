class ClaudeMonitor < Formula
  include Language::Python::Shebang

  desc "Pixel-animated Claude usage monitor: doom-fire, tokenfall, invaders"
  homepage "https://github.com/xyanwert/usage-monitor"
  url "https://github.com/xyanwert/usage-monitor/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1265630441b70f62fa2505041c84ea2342357c1a9650dd6c4846837cd280bfb0"
  license "MIT"

  depends_on "python@3.13"

  def install
    rewrite_shebang detected_python_shebang, "claude_monitor.py"
    bin.install "claude_monitor.py" => "claude-monitor"
  end

  def caveats
    <<~EOS
      Reads your logged-in Claude Code credentials (Keychain on macOS).
      For the split-screen dock (claude-monitor side claude):  brew install tmux
      Apple Terminal lacks truecolor — use iTerm2, Ghostty, kitty, or WezTerm.
    EOS
  end

  test do
    assert_match "Burnout", shell_output("#{bin}/claude-monitor --help")
  end
end
