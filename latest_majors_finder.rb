# frozen_string_literal: true

class LatestMajorsFinder
  def initialize(sorted_versions)
    @sorted_versions = sorted_versions
  end

  def call
    sorted_versions_group.map do |lead, sorted_versions|
      find_major(sorted_versions)
    end
  end

  private

  attr_reader :sorted_versions

  # {
  #   "08" => %w(0.8.0 0.8.5),
  #   ...
  #   "52" => %w(5.2.0.beta1 5.2.0.beta2 5.2.0.rc1 5.2.0.rc2 5.2.0 5.2.1.rc1)
  # }
  def sorted_versions_group
    @_sorted_versions_group ||= begin
      sorted_versions.group_by do |version|
        version.split(".").first(2).join
      end
    end
  end

  def find_major(sorted_versions)
    sorted_versions.reverse.find do |version|
      !prerelease?(version)
    end
  end

  def prerelease?(version)
    Gem::Version.new(version).prerelease?
  end
end
