# frozen_string_literal: true

# REF http://www.carlosramireziii.com/what-options-can-be-passed-to-the-active-storage-variant-method.html?utm_source=rubyflow
# REF https://prograils.com/posts/rails-5-2-active-storage-new-approach-to-file-uploads

class Uploads
  class << self
    def jpeg?(blob)
      blob.content_type.include? 'jpeg'
    end

    def optimize
      {
        strip: true
      }
    end

    def optimize_jpeg
      {
        strip: true,
        'sampling-factor' => '4:2:0',
        quality: '85',
        interlace: 'JPEG',
        colorspace: 'sRGB'
      }
    end

    def optimize_hash(blob)
      return optimize_jpeg if jpeg? blob

      optimize
    end

    def resize_to_fit(width: nil, height: nil, blob:, message:)
      n = 5
      pointsize = width / n
      num = n - 1
      fill = 'red'
      gravity = 'north'
      resize = resize(width: width, height: height)
      optimize_hash(blob).merge(resize: resize,
                                combine_options: { font: font, fill: fill, gravity: gravity, pointsize: pointsize,
                                                   draw: "text 0,#{pointsize / 5} '#{new_lined_message(message, num)}' " })
    end

    private

    def new_lined_message(message, length = 4)
      message.scan(/.{1,#{length}}/).join("\n")
    end

    def font
      # https://googlefonts.github.io/japanese/
      # '.fonts/FontopoNIKUKYU.otf'
      # '.fonts/ipaexg.ttf'
      '.fonts/nicomoji-plus_1.11.ttf'
    end

    def resize(width:, height:)
      if width && height
        "#{width}x#{height}"
      elsif width
        "#{width}x"
      else
        "x#{height}"
      end
    end
  end
end
