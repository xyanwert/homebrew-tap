class ClaudeMonitor < Formula
  include Language::Python::Shebang

  desc "Pixel-animated Claude usage monitor: doom-fire, tokenfall, invaders, cube"
  homepage "https://github.com/xyanwert/usage-monitor"
  url "https://github.com/xyanwert/usage-monitor/archive/refs/tags/v1.1.7.tar.gz"
  sha256 "eed4b64ba6534384d24f8072e73be7e5f72d5a84692927a1cf9e6f79483e257d"
  license "MIT"
  head "https://github.com/xyanwert/usage-monitor.git", branch: "main"

  depends_on "python@3.13"
  depends_on "tmux"

  def install
    rewrite_shebang detected_python_shebang, "claude_monitor.py"
    bin.install "claude_monitor.py" => "claude-monitor"
    # Same script, second name: launched as `open-claude` it opens the dock
    # plus a 1-4 pane grid of Claude consoles + terminals (argv[0] selects
    # the launcher).
    bin.install_symlink "claude-monitor" => "open-claude"
  end

  def caveats
    <<~EOS
      Reads your logged-in Claude Code credentials (Keychain on macOS).
      Apple's Terminal.app lacks truecolor — use iTerm2, Ghostty, kitty, or WezTerm.
      Split-screen dock:  claude-monitor side claude
      Multi-pane dock:    open-claude [n]  (1-4: Claude consoles + terminals)
    EOS
  end

  test do
    assert_match "Burnout", shell_output("#{bin}/claude-monitor --help")
    assert_match "open-claude", shell_output("#{bin}/open-claude --help")
  end
end
