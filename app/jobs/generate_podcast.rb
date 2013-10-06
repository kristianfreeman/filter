module GeneratePodcast
  @queue = :filter_queue

  class << self
    def perform
      @podcasts = Podcast.all
      @podcasts.each do |podcast|
        puts "Processing #{ podcast.name }."
        PodcastJobUtils.new(podcast.id).process_podcast
      end
    end
  end
end
