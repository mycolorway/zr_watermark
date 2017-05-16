require "zr_watermark/version"

module ZrWatermark
  # Your code goes here...
  class CLI
    def self.bin
      File.join File.dirname(__dir__), 'bin'
    end

    def self.excutable
      if RUBY_PLATFORM.match(/darwin/)
        File.join(bin, 'watermark')
      else
        File.join(bin, 'watermark_linux')
      end
    end
  end
end
