class WakatimeCli < Formula
  desc "Command-line interface to the WakaTime api"
  homepage "https://wakatime.com/"
  url "https://github.com/wakatime/wakatime-cli.git",
    tag:      "v1.27.0",
    revision: "10b3e68df13901dad7c6d03697260c54a921afbf"
  license "BSD-3-Clause"
  version_scheme 1

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "062307ba64d4afeda4bdae8c912a9c69d5e28078f7e4169aafb0c14c355cd297"
    sha256 cellar: :any_skip_relocation, big_sur:       "3435709410408bacf076594f87fffe654048e4e7aabe124f7f6bb37bbf3943e9"
    sha256 cellar: :any_skip_relocation, catalina:      "1573e0dd92f96002d51d388bb75f4ea06946dacf8c2e46c2408513c0a13c9feb"
    sha256 cellar: :any_skip_relocation, mojave:        "84e365ad5241e4c17926bb32730cbf0d2d9de798551e137fe568a3934e7d733f"
    sha256 cellar: :any_skip_relocation, high_sierra:   "9c4ddbce30fc3b94deb970c30527a80534e4389810524cfc58b634fc0863fc0c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fcc5439d9c9fdf6e0661a8982f046f1ebdd45eef1f677779f614810bfab5cbc5"
  end

  depends_on "go" => :build

  def install
    arch = Hardware::CPU.intel? ? "amd64" : Hardware::CPU.arch.to_s
    ldflags = %W[
      -s -w
      -X github.com/wakatime/wakatime-cli/pkg/version.Arch=#{arch}
      -X github.com/wakatime/wakatime-cli/pkg/version.BuildDate=#{time.iso8601}
      -X github.com/wakatime/wakatime-cli/pkg/version.Commit=#{Utils.git_head(length: 7)}
      -X github.com/wakatime/wakatime-cli/pkg/version.OS=#{OS.kernel_name.downcase}
      -X github.com/wakatime/wakatime-cli/pkg/version.Version=v#{version}
    ].join(" ")
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    output = shell_output("#{bin}/wakatime-cli --help 2>&1")
    assert_match "Command line interface used by all WakaTime text editor plugins", output
  end
end
