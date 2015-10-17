class Bookmark < ActiveRecord::Base
  belongs_to :topic
  after_create :get_embedly

private
  def get_embedly
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_API_KEY'],
        :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'

  # single url
    obj = embedly_api.extract :url => url
    # Rails.logger.info ">>>> EMBEDLY: #{JSON.pretty_generate(obj[0].marshal_dump)}"
    self.embedly = obj[0]['images'].first['url'] if obj && obj[0]['images']

    self.save!
  end

end
