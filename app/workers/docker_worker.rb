class DockerWorker
  include Sidekiq::Worker

  def perform(*args)
    puts 'testing'
    # Do something
  end
end
