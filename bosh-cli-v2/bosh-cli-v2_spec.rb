require 'spec_helper'
require 'docker'
require 'serverspec'

BOSH_CLI_VERSION="7.7.1" # renovate: datasource=github-releases depName=cloudfoundry/bosh-cli
CREDHUB_CLI_VERSION='2.9.42' # renovate: datasource=github-releases depName=cloudfoundry/credhub-cli
RUBY_VERSION = "3.1"

BOSH_ENV_DEPS = "build-essential zlib1g-dev openssl libxslt1-dev libxml2-dev \
    libssl-dev libreadline8 libreadline-dev libyaml-dev libsqlite3-dev sqlite3"

describe "bosh-cli-v2 image" do
  before(:all) {
    set :docker_image, find_image_id('bosh-cli-v2:latest')
  }

  it "installs required packages" do
    BOSH_ENV_DEPS.split(' ').each do |package|
      expect(package(package)).to be_installed
    end
  end

  it "has the expected version of the Bosh CLI (#{BOSH_CLI_VERSION})" do
    expect(
      command("bosh -v").stdout.strip
    ).to match("version #{BOSH_CLI_VERSION}$")
  end

  it "has `file` available" do
    expect(
      command("file --version").exit_status
    ).to eq(0)
  end

  it "has ssh available" do
    expect(
      command("ssh -V").exit_status
    ).to eq(0)
  end

  it "can run git" do
    expect(command('git --version').exit_status).to eq(0)
  end

  it "can run credhub (#{CREDHUB_CLI_VERSION})" do
    cmd = command('credhub --version')
    expect(cmd.exit_status).to eq(0)
    expect(cmd.stdout.match?(/#{CREDHUB_CLI_VERSION}\n/)).to eq(true)
  end

  it "has `bash` available" do
    expect(
      command("bash --version").exit_status
    ).to eq(0)
  end

  it "has `jq` available" do
    expect(
      command("jq --version").exit_status
    ).to eq(0)
  end

  it "has `yq` available" do
    expect(
      command("yq --version").exit_status
    ).to eq(0)
  end

  it "has a new enough version of openssl available" do
    # wget (from busybox) requires openssl to be able to connect to https sites.

    # See https://github.com/nahi/httpclient/blob/v2.7.1/lib/httpclient/ssl_config.rb#L441-L452
    # (httpclient is a dependency of bosh_cli)
    # With an older version of openssl, bosh_cli spits out warnings.
    cmd = command("openssl version")
    expect(cmd.exit_status).to eq(0)

    ssl_version_str = cmd.stdout.strip
    if ssl_version_str.start_with?('OpenSSL 1.0.1')
      expect(ssl_version_str).to be >= 'OpenSSL 1.0.1p'
    else
      expect(ssl_version_str).to be >= 'OpenSSL 1.0.2d'
    end
  end

  it "has ruby #{RUBY_VERSION} available" do
    cmd = command("ruby -v")
    expect(cmd.exit_status).to eq(0)
    expect(cmd.stdout).to match(/^ruby #{RUBY_VERSION}/)
  end

  it "does not contain the compiled CPI packages" do
    installation_path = '/root/.bosh/installations/44f01911-a47a-4a24-6ca3-a3109b33f058'
    packages_file = file("#{installation_path}/compiled_packages.json")
    expect(packages_file).not_to exist
  end
end
