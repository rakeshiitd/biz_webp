# encoding: utf-8

require 'webp-ffi'
require 'carrierwave/sanitized_file'
module CarrierWave
  module BizWebp
    module Webpconverter
      def convert_to_webp(options = {},path)
        manipulate! do |img|
          img          = yield(img) if block_given?
          puts path
          webp_path    = "#{img.path}.webp"
          old_filename = filename

          ::WebP.encode(img.path, webp_path, options)

          puts "hey--->"
          puts webp_path.to_s()

          puts "filename--->"
          puts old_filename

          puts "newfilename"

          # XXX: Hacks ahead!
          # I can't find any other way to store an alomost exact copy
          # of file for any particular version
          #instance_variable_set('@filename', "#{filename}.webp")

          storage.store! SanitizedFile.new({
                                               tempfile: webp_path, filename: webp_path,
                                               content_type: 'image/webp'
                                           })

          instance_variable_set('@filename', old_filename)

          img
        end
      end
    end
  end
end