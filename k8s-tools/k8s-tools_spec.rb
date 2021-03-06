require 'spec_helper'
require 'docker'
require 'serverspec'

YTT_VERSION="0.30.0"
CREDHUB_VERSION='2.8.0'
KUSTOMIZE_VERSION="3.8.4"
KAPP_VERSION="0.34.0"
KUBECTL_VERSION="1.18.8"
HELM_VERSION="3.3.3"
KUTTL_VERSION="0.6.1"

DEPS = "unzip curl openssl ca-certificates git libc6 bash jq gettext"

describe "k8s image" do
  before(:all) {
    set :docker_image, find_image_id('k8s-tools:latest')
  }

  it "installs required packages" do
    DEPS.split(' ').each do |package|
      expect(package(package)).to be_installed
    end
  end

  it "has the expected version of YTT (#{YTT_VERSION})" do
    expect(
        command("ytt --version").stdout.strip
    ).to eq("ytt version #{YTT_VERSION}")
  end

  it "has the expected version of credhub (#{CREDHUB_VERSION})" do
    expect(
        command("credhub --version").stdout.strip
    ).to match("#{CREDHUB_VERSION}")
  end

  it "has the expected version of Kustomize (#{KUSTOMIZE_VERSION})" do
    expect(
      command("kustomize version").stdout
    ).to match(/#{KUSTOMIZE_VERSION}/)
  end

  it "has the expected version of Kapp (#{KAPP_VERSION})" do
    expect(
        command("kapp --version").stdout
    ).to match(/#{KAPP_VERSION}/)
  end

  it "has the expected version of helm (#{HELM_VERSION})" do
    expect(
        command("helm version --short").stdout
    ).to match(/#{HELM_VERSION}/)
  end

  it "has the expected version of kuttle (#{KUTTL_VERSION})" do
    expect(
        command("kuttl version").stdout
    ).to match(/#{KUTTL_VERSION}/)
  end

  it "has curl available" do
    expect(
      command("curl --version").exit_status
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

  it "has ruby 2.7 available" do
    cmd = command("ruby -v")
    expect(cmd.exit_status).to eq(0)
    expect(cmd.stdout).to match(/^ruby 2.7/)
  end

  it "has ruby json gem available" do
    cmd = command("ruby -e 'require \"json\"'")
    expect(cmd.exit_status).to eq(0)
  end

  it "has ruby yaml gem available" do
    cmd = command("ruby -e 'require \"yaml\"'")
    expect(cmd.exit_status).to eq(0)
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

end
