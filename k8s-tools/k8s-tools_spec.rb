require 'spec_helper'
require 'docker'
require 'serverspec'

BOSH_CLI_VERSION="7.9.15" # renovate: datasource=github-releases depName=cloudfoundry/bosh-cli
YTT_VERSION="0.52.2"  # renovate: datasource=github-releases depName=k14s/ytt
CREDHUB_CLI_VERSION='2.9.52' # renovate: datasource=github-releases depName=cloudfoundry/credhub-cli
KUSTOMIZE_VERSION="5.0.3" # renovate: datasource=github-releases depName=kubernetes-sigs/kustomize
KAPP_VERSION="0.65.0" # renovate: datasource=github-releases depName=k14s/kapp
KUBECTL_VERSION="1.32.11" # renovate: datasource=github-tags depName=kubernetes/kubectl
HELM_VERSION="3.14.4" # renovate: datasource=github-releases depName=helm/helm
KUTTL_VERSION="0.24.0" # renovate: datasource=github-releases depName=kudobuilder/kuttl
RUBY_VERSION = "3.4"

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

  it "has the expected version of Kubectl (#{KUBECTL_VERSION}) with embedded Kustomize" do
    EMBEDDED_KUSTOMIZE_VERSION="5.0.4-0.20230601165947-6ce0bf390ce3"
    expect(
        command("kubectl version --client=true").stdout.strip
    # ).to eq("Client Version: v#{KUBECTL_VERSION}\nKustomize Version: v#{KUSTOMIZE_VERSION}")
    ).to eq("Client Version: v#{KUBECTL_VERSION}\nKustomize Version: v#{EMBEDDED_KUSTOMIZE_VERSION}")
  end

  it "has the expected version of YTT (#{YTT_VERSION})" do
    expect(
        command("ytt --version").stdout.strip
    ).to eq("ytt version #{YTT_VERSION}")
  end

  it "has the expected version of credhub (#{CREDHUB_CLI_VERSION})" do
    expect(
        command("credhub --version").stdout.strip
    ).to match("#{CREDHUB_CLI_VERSION}\n")
  end

  it "has the expected version of stand-alone Kustomize (#{KUSTOMIZE_VERSION})" do
    expect(
      command("kustomize version").stdout
    ).to match("v#{KUSTOMIZE_VERSION}\n")
  end

  it "has NOT the expected version of Kapp (#{KAPP_VERSION})" do
    expect(
        command("kapp --version").stderr
    ).to match(/kapp: not found/)
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

  it "has `yq` available" do
    expect(
      command("yq --version").exit_status
    ).to eq(0)
  end

  it "has the expected version of the Bosh CLI" do
    expect(
      command("bosh -v").stdout.strip
    ).to match("version #{BOSH_CLI_VERSION}$")
  end
end
