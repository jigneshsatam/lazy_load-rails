module LazyLoad
  module Rails
    module ApplicationHelper
      def lazy_load(url, options = {})
        options = options.symbolize_keys
        id = options[:id].presence
        classes = ("lazy_load " + options[:class] rescue "lazy_load")
        params = options[:params]
        data_merge_hash = {}
        options[:later].present? && (options[:later].to_s.downcase == "true") && (data_merge_hash[:later] = true)
        options[:loader].present? && (options[:loader].to_s.downcase == "off") && (data_merge_hash[:loader] = false)
        options[:type].present? && (["script", "json"].include?(options[:type])) && (data_merge_hash[:type] = options[:type])
        options[:success].present? && data_merge_hash[:success] = options[:success]
        options[:failure].present? && data_merge_hash[:failure] = options[:failure]
        options[:complete].present? && data_merge_hash[:complete] = options[:complete]
        content_tag("input", nil, type:"hidden", id: id, class: classes, data: {id: SecureRandom.uuid, url: url}.merge!(data_merge_hash))
      end
    end
  end
end
