class Awscli < Formula
  include Language::Python::Virtualenv

  desc "Official Amazon AWS command-line interface"
  homepage "https://aws.amazon.com/cli/"
  url "https://github.com/aws/aws-cli/archive/refs/tags/2.15.19.tar.gz"
  sha256 "64aa76e838922e506e07439a61bf3109b14429a92f04b290f813917464185abc"
  license "Apache-2.0"
  head "https://github.com/aws/aws-cli.git", branch: "v2"

  bottle do
    sha256 cellar: :any,                 arm64_sonoma:   "bbb46b6fc7b93d774aebce1a4086abb2930770a39c18207d2639901b88165c00"
    sha256 cellar: :any,                 arm64_ventura:  "65d5fb7b7891fbb485d7994511dbb529abb43cdbeb1c0c885a67b0ca71ddf3a1"
    sha256 cellar: :any,                 arm64_monterey: "4f9af67d261b47a3165ad68d787f6576c2b917358932ab42320e137d1aa0ce24"
    sha256 cellar: :any,                 sonoma:         "0b6fadb478315a64f38e6ee4cf0498427156a297f8404f8e2a946d2771938833"
    sha256 cellar: :any,                 ventura:        "82d9abf0fb90693a202542c6f09514c3a45fdbe9ddbd5bda5e147a8f17560c19"
    sha256 cellar: :any,                 monterey:       "5292d250435fc36baba818fab09221bdc2ae47f58d5f31d98eb425d2fbac05c7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "3caa3a676462bcb84e597dc468b05e8c52cf85431307bca9bf64621b4dcad6dd"
  end

  # `pkg-config`, `rust`, and `openssl@3` are for cryptography.
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "cffi"
  depends_on "docutils"
  depends_on "openssl@3"
  depends_on "pycparser"
  depends_on "python@3.11" # Python 3.12 issue: https://github.com/aws/aws-cli/issues/8342
  depends_on "six"

  uses_from_macos "mandoc"

  resource "awscrt" do
    url "https://files.pythonhosted.org/packages/69/25/b1c6d1c3aeed90cb6ce69a6c5136caeb7f43f8d81a87f626d6a21b082afc/awscrt-0.19.19.tar.gz"
    sha256 "1c1511535dee146a6c26a382ed3ead56259a105b3b7d7d823553ae567d038dfe"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4/colorama-0.4.6.tar.gz"
    sha256 "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/15/d9/c679e9eda76bfc0d60c9d7a4084ca52d0631d9f24ef04f818012f6d1282e/cryptography-40.0.1.tar.gz"
    sha256 "2803f2f8b1e95f614419926c7e6f55d828afc614ca5ed61543877ae668cc3472"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/4b/89/eaa3a3587ebf8bed93e45aa79be8c2af77d50790d15b53f6dfc85b57f398/distro-1.8.0.tar.gz"
    sha256 "02e111d1dc6a50abb8eed6bf31c3e48ed8b0830d1ea2a1b78c61765c2513fdd8"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/00/2a/e867e8531cf3e36b41201936b7fa7ba7b5702dbef42922193f05c8976cd6/jmespath-1.0.1.tar.gz"
    sha256 "90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/4b/bb/75cdcd356f57d17b295aba121494c2333d26bfff1a837e6199b8b83c415a/prompt_toolkit-3.0.38.tar.gz"
    sha256 "23ac5d50538a9a38c8bde05fecb47d0b403ecd0662857a86f886f798563d5b9b"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9/python-dateutil-2.8.2.tar.gz"
    sha256 "0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86"
  end

  resource "ruamel-yaml" do
    url "https://files.pythonhosted.org/packages/46/a9/6ed24832095b692a8cecc323230ce2ec3480015fbfa4b79941bd41b23a3c/ruamel.yaml-0.17.21.tar.gz"
    sha256 "8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af"
  end

  resource "ruamel-yaml-clib" do
    url "https://files.pythonhosted.org/packages/d5/31/a3e6411947eb7a4f1c669f887e9e47d61a68f9d117f10c3c620296694a0b/ruamel.yaml.clib-0.2.7.tar.gz"
    sha256 "1f08fd5a2bea9c4180db71678e850b995d2a5f4537be0e94557668cf0f5f9497"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/0c/39/64487bf07df2ed854cc06078c27c0d0abc59bd27b32232876e403c333a08/urllib3-1.26.18.tar.gz"
    sha256 "f8ecc1bba5667413457c529ab955bf8c67b45db799d159066261719e328580a0"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/6c/63/53559446a878410fc5a5974feb13d31d78d752eb18aeba59c7fef1af7598/wcwidth-0.2.13.tar.gz"
    sha256 "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
  end

  def python3
    which("python3.11")
  end

  def install
    # Ensure that the `openssl` crate picks up the intended library.
    ENV["OPENSSL_DIR"] = Formula["openssl@3"].opt_prefix
    ENV["OPENSSL_NO_VENDOR"] = "1"

    # Temporary workaround for Xcode 14's ld causing build failure (without logging a reason):
    # ld: fatal warning(s) induced error (-fatal_warnings)
    # Ref: https://github.com/python/cpython/issues/97524
    ENV.append "LDFLAGS", "-Wl,-no_fixup_chains" if DevelopmentTools.clang_build_version >= 1400

    # The `awscrt` package uses its own libcrypto.a on Linux. When building _awscrt.*.so,
    # Homebrew's default environment causes issues, which may be due to `openssl` flags.
    # This causes installation to fail while running `scripts/gen-ac-index` with error:
    # ImportError: _awscrt.cpython-39-x86_64-linux-gnu.so: undefined symbol: EVP_CIPHER_CTX_init
    # As workaround, add relative path to local libcrypto.a before openssl's so it gets picked.
    if OS.linux?
      python_version = Language::Python.major_minor_version(python3)
      ENV.prepend "CFLAGS", "-I./build/temp.linux-x86_64-#{python_version}/deps/install/include"
      ENV.prepend "LDFLAGS", "-L./build/temp.linux-x86_64-#{python_version}/deps/install/lib"
    end

    virtualenv_install_with_resources(system_site_packages: false)

    pkgshare.install "awscli/examples"

    rm bin.glob("{aws.cmd,aws_bash_completer,aws_zsh_completer.sh}")
    bash_completion.install "bin/aws_bash_completer"
    zsh_completion.install "bin/aws_zsh_completer.sh"
    (zsh_completion/"_aws").write <<~EOS
      #compdef aws
      _aws () {
        local e
        e=$(dirname ${funcsourcetrace[1]%:*})/aws_zsh_completer.sh
        if [[ -f $e ]]; then source $e; fi
      }
    EOS
  end

  def caveats
    <<~EOS
      The "examples" directory has been installed to:
        #{HOMEBREW_PREFIX}/share/awscli/examples
    EOS
  end

  test do
    assert_match "topics", shell_output("#{bin}/aws help")
    site_packages = libexec/Language::Python.site_packages(python3)
    assert_includes Dir[site_packages/"awscli/data/*"], "#{site_packages}/awscli/data/ac.index"
  end
end
