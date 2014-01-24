module Jekyll
  module AssetFilter
    def asset_url(input)
      cdn = @context.registers[:site].config['cdn']
      "#{cdn}#{input}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)

