class TestJob
  include Sidekiq::Job

  def perform(*args)
    puts 'Job starting!'

    puts args

    puts 'Job end!'
  end
end
