require "octokit"
require "sinatra/base"
require "open-uri"

class NoAccessTokenError < StandardError; end

class Badge < Sinatra::Base
  before do
    # init github client
    pass if request.path_info == "/"
    if access_token.empty?
      raise NoAccessTokenError, "No access token error."
    end
    
    Octokit.configure do |c|
      c.default_media_type = "application/vnd.github.drax-preview+json"
    end
    @client = Octokit::Client.new(:access_token => access_token)

    # set content-type
    content_type "image/svg+xml"
  end

  get "/:user/:repo/stars.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")
    name_and_color = get_name_and_color(params, {:name => "stars", :color => "blue"})
    fetch_image(name_and_color[:name], repo.stargazers_count, name_and_color[:color])
  end

  get "/:user/:repo/forks.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")
    name_and_color = get_name_and_color(params, {:name => "forks", :color => "blue"})
    fetch_image(name_and_color[:name], repo.forks_count, name_and_color[:color])
  end

  get "/:user/:repo/watchers.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")
    name_and_color = get_name_and_color(params, {:name => "watchers", :color => "blue"})
    fetch_image(name_and_color[:name], repo.watchers_count, name_and_color[:color])
  end

  get "/:user/:repo/issues.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")
    name_and_color = get_name_and_color(params, {:name => "issues", :color => "red"})
    fetch_image(name_and_color[:name], repo.open_issues_count, name_and_color[:color])
  end

  get "/:user/:repo/network.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")
    name_and_color = get_name_and_color(params, {:name => "network", :color => "green"})
    fetch_image(name_and_color[:name], repo.network_count, name_and_color[:color])
  end

  get "/:user/:repo/subscribers.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")
    name_and_color = get_name_and_color(params, {:name => "subscribers", :color => "red"})
    fetch_image(name_and_color[:name], repo.subscribers_count, name_and_color[:color])
  end

  get "/:user/:repo/last-pushed.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")
    update_time = repo.pushed_at.strftime('%Y--%m--%d%%20%H:%I:%S')
    name_and_color = get_name_and_color(params, {:name => "last pushed", :color => "green"})
    fetch_image(name_and_color[:name], update_time, name_and_color[:color])
  end

  get "/:user/:repo/last-pages-build.svg" do
    repo = @client.latest_pages_build("#{params['user']}/#{params['repo']}")
    update_time = repo.updated_at.strftime('%Y--%m--%d%%20%H:%I:%S')
    name_and_color = get_name_and_color(params, {:name => "last build", :color => "green"})
    fetch_image(name_and_color[:name], update_time, name_and_color[:color])
  end

  get "/:user/:repo/license.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")
    name_and_color = get_name_and_color(params, {:name => "license", :color => "blue"})
    fetch_image(name_and_color[:name], repo.license.spdx_id, name_and_color[:color])
  end

  get "/:user/:repo/language.svg" do
    repo = @client.repository("#{params['user']}/#{params['repo']}")
    name_and_color = get_name_and_color(params, {:name => "language", :color => "blue"})
    fetch_image(name_and_color[:name], repo.language, name_and_color[:color])
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

  def get_name_and_color(params, default_params)
    name = params["name"] || default_params[:name]
    color = params["color"] || default_params[:color]
    {:name => URI.escape(name), :color => color}
  end
end
