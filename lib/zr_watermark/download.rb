require 'ruby-progressbar'
require 'open-uri'

module ZrWatermark

  class Download
    def self.start(url, save_to)
      pbar = nil
       File.open(save_to, "wb") do |saved_file|
         open(url, "rb",
              :content_length_proc => lambda {|t|
           if t && 0 < t
             pbar = ProgressBar.create(total: t)
           end
         },
         :progress_proc => lambda {|s|
           pbar.progress = s if pbar
         }) do |read_file|
           saved_file.write(read_file.read)
         end
       end
       %x[chmod +x #{save_to}]
    end
  end

end
