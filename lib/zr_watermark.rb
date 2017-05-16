require "zr_watermark/version"

module ZrWatermark
  # Your code goes here...
  class CLI
    def self.excutable
      if RUBY_PLATFORM.match(/darwin/)
        Gem.bin_path('zr_watermark', 'watermark')
      else
        Gem.bin_path('zr_watermark', 'watermark_linux')
      end
    end
  end
end
