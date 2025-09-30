require 'spec_helper'
require 'docker'
require 'serverspec'

BOSH_CLI_VERSION="7.9.11" # renovate: datasource=github-releases depName=cloudfoundry/bosh-cli
CF_CLI_VERSION="8.16.0" # renovate: datasource=github-releases depName=cloudfoundry/cli
SPRUCE_BIN = "/usr/local/bin/spruce"
SPRUCE_VERSION = "1.31.1" # renovate: datasource=github-releases depName=geofffranks/spruce
BOSH_ENV_DEPS = "build-essential zlib1g-dev openssl libxslt1-dev libxml2-dev \
    libssl-dev libreadline8 libreadline-dev libyaml-dev libsqlite3-dev sqlite3"
CF_ENV_DEPS = "unzip curl openssl ca-certificates git libc6 bash jq gettext make"
RUBY_VERSION = "3.4"

describe "bosh-cli-v2-cf-cli image" do
  before(:all) {
    set :docker_image, find_image_id('bosh-cli-v2-cf-cli:latest')
  }

  it "installs required bosh packages" do
    BOSH_ENV_DEPS.split(' ').each do |package|
      expect(package(package)).to be_installed
    end
  end

  it "installs required cf packages" do
    CF_ENV_DEPS.split(' ').each do |package|
      expect(package(package)).to be_installed
    end
  end

  it "has the expected version of the Bosh CLI (#{BOSH_CLI_VERSION})" do
    expect(
      command("bosh -v").stdout.strip
    ).to match("version #{BOSH_CLI_VERSION}$")
  end

  it "has the expected version of the CF CLI (#{CF_CLI_VERSION})" do
    expect(
      command("cf --version").stdout
    ).to match(/cf version #{CF_CLI_VERSION}/)
  end

  it "has curl available" do
    expect(
      command("curl --version").exit_status
    ).to eq(0)
  end

  it "has make available" do
    expect(
      command("make --version").exit_status
    ).to eq(0)
  end

  it "has unzip available" do
    expect(
      command("unzip -v").exit_status
    ).to eq(0)
  end

  it "has git available" do
    expect(
      command("git --version").exit_status
    ).to eq(0)
  end

  it "has jq available" do
    cmd = command("jq --version")
    expect(cmd.exit_status).to eq(0)
  end

  it "has ruby #{RUBY_VERSION} available" do
    cmd = command("ruby -v")
    expect(cmd.exit_status).to eq(0)
    expect(cmd.stdout).to match(/^ruby #{RUBY_VERSION}/)
  end

  it "has ruby json gem available" do
    cmd = command("ruby -e 'require \"json\"'")
    expect(cmd.exit_status).to eq(0)
  end

  it "has ruby yaml gem available" do
    cmd = command("ruby -e 'require \"yaml\"'")
    expect(cmd.exit_status).to eq(0)
  end

  it "checks if spruce binary exists and is a file" do
    expect(file(SPRUCE_BIN)).to be_file
  end

  it "checks if spruce binary is executable" do
    expect(file(SPRUCE_BIN)).to be_mode 755
  end

  it "has the spruce version #{SPRUCE_VERSION}" do
    spruce_version = command("spruce --version").stdout.strip
    expect(spruce_version).to match(/spruce - Version v#{SPRUCE_VERSION}( \(master\))?/)
  end

  it "has `bash` available" do
    expect(
      command("bash --version").exit_status
    ).to eq(0)
  end

  it "has `envsubst` available" do
    expect(
      command("envsubst --help").exit_status
    ).to eq(0)
  end

  it "has `jq` available" do
    expect(
      command("jq --help").exit_status
    ).to eq(0)
  end

  it "has `host` available" do
    expect(
      command("host -V").exit_status
    ).to eq(0)
  end

  it "has `zip` available" do
    expect(
      command("zip --version").exit_status
    ).to eq(0)
  end

  it "has `scp` provided by `ssh` available" do
    expect(
      command("ssh -V").exit_status
    ).to eq(0)
  end
end
