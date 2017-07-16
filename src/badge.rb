require "octokit"
require "sinatra/base"
require "open-uri"

class NoAccessTokenError < StandardError; end

class Badge < Sinatra::Base
  before do
    pass if request.path_info == "/"
    if access_token.empty?
      raise NoAccessTokenError, "No access token error."
    end
    
    @client = Octokit::Client.new(:access_token => access_token)
  end

  get "/:user/:repo/stars.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")

    content_type "image/svg+xml"
    fetch_image("stars", repo.stargazers_count, "blue")
  end

  get "/:user/:repo/forks.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")

    content_type "image/svg+xml"
    fetch_image("forks", repo.forks_count, "blue")
  end

  get "/:user/:repo/watchers.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")

    content_type "image/svg+xml"
    fetch_image("watchers", repo.watchers_count, "blue")
  end

  get "/:user/:repo/issues.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")

    content_type "image/svg+xml"
    fetch_image("issues", repo.open_issues_count, "red")
  end

  get "/:user/:repo/last-pages-build.svg" do
    repo = @client.latest_pages_build("#{params['user']}/#{params['repo']}")
    update_time = repo.updated_at.strftime('%Y--%m--%d%%20%H:%I:%S')

    content_type "image/svg+xml"
    fetch_image("last%20build", update_time, "green")
  end

  not_found do
    redirect "https://crispgm.github.io/github-meta-badges"
  end

  private 
  def access_token
    ENV["GITHUB_ACCESS_TOKEN"] || ""
  end

  def fetch_image(key, value, color)
    img_url = "https://img.shields.io/badge/#{key}-#{value}-#{color}.svg"

    open(img_url) do |http|
      http.read
    end
  end
end
