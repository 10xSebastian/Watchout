require 'open-uri'

class StreamsController < ApplicationController

  def show
    streams = YAML.load_file(Rails.root.join('config', 'streams.yml'))
    stream = streams.detect{|s| s['id'] == params[:id]}
    render status: :ok, text: open(stream['location']).read, content_type: :json
  end

end
