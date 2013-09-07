defmodule ExCoveralls.Travis do
  @moduledoc """
  Handles travis-ci integration with coveralls.
  """
  alias ExCoveralls.Utils
  alias ExCoveralls.Poster

  def execute(stats) do
    generate_json(stats) |> Poster.execute
  end

  def generate_json(stats) do
    JSON.encode!([
      service_job_id: get_job_id,
      service_name: "travis-ci",
      source_files: stats
    ])
  end

  def get_job_id do
    System.get_env("TRAVIS_JOB_ID")
  end
end