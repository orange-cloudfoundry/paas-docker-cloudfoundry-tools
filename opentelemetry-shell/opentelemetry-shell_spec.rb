require 'spec_helper'
require 'docker'
require 'serverspec'

OT_SHELL_VERSION="5.42.0" # renovate: datasource=github-releases depName=plengauer/Thoth

describe "opentelemetry-shell image" do
  before(:all) {
    set :docker_image, find_image_id(ENV['DOCKER_IMAGE']||File.basename(__FILE__,'_spec.rb')+':latest')
  }

  it "has aliases cache" do
    expect(
      command("ls /tmp").stdout
    ).to match(/opentelemetry_shell_#{OT_SHELL_VERSION}_bash_instrumentation_cache_.*.aliases/)
  end

  it "has git available" do
    expect(
      command("git version").exit_status
    ).to eq(0)
  end

  it "has unzip available" do
    expect(
      command("unzip -v").exit_status
    ).to eq(0)
  end

  it "has jq available" do
    expect(
      command("jq --version").exit_status
    ).to eq(0)
  end

  it "has python available " do
    expect(
      command("python3 --version").exit_status
    ).to eq(0)
  end

end
