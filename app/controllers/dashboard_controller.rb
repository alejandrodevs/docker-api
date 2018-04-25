class DashboardController < ApplicationController
  def index
    DockerWorker.perform_async
    render json: 'Hello world!!!'
  end
end
