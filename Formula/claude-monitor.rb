class ClaudeMonitor < Formula
  include Language::Python::Shebang

  desc "Pixel-animated Claude usage monitor: doom-fire, tokenfall, invaders"
  homepage "https://github.com/xyanwert/usage-monitor"
  url "https://github.com/xyanwert/usage-monitor/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "b55f59e9e3c32f03756598f16eabff98c877bf0c7dc1a7906f45fcfa2fb94abb"
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
