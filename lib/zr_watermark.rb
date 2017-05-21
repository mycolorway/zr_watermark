require "zr_watermark/version"
require "zr_watermark/download"
require 'digest'

module ZrWatermark
  # Your code goes here...
  class CLI
    def self.executable
      new.executable
    end

    def bin(file_name)
      File.join File.dirname(__dir__), "lib/bin/#{file_name}"
    end

    def executable
      file_path = bin(excutable_file_name)
      if File.exist?(file_path) && (Digest::MD5.hexdigest(File.read(file_path)) == checksum)
        file_path
      else
        FileUtils.rm file_path, force: true
        puts "bin not exist, start download #{excutable_file_name}:"
        ZrWatermark::Download.start("https://watermark.zhiren.com/watermark/#{excutable_file_name}", file_path)
        executable
      end
    end

    def excutable_file_name
      RUBY_PLATFORM.match(/darwin/) ? 'watermark' : 'watermark_linux'
    end

    def checksum
      if excutable_file_name == 'watermark'
        "285a3f8577a7a2cdd78abc6706e7b4ae"
      else
        "4120a6b2858818b2dc98d1eef2c813e2"
      end
    end
  end
end
