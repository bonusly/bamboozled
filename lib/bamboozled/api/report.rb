module Bamboozled
  module API
    class Report < Base

      def find(number, format = 'JSON', fd = true)
        request(:get, "reports/#{number}?format=#{format.upcase}&fd=#{fd.yesno}")
      end

      def custom(fields, format = 'JSON')
        options = {
          body: "<report>#{FieldCollection.wrap(fields).to_xml}</report>"
        }

        response = request(:post, "reports/custom?format=#{format.upcase}", options)
        response["employees"]
      end
    end
  end
end
