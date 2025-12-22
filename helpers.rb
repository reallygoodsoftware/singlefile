module AppHelpers

  def metadata
    {
      title: "SingleFile",
      description: "A starter with everything you need to build stylish, fast web apps",
      image: "/images/logo.png",
      url: ""
    }
  end

  def asset_urls(latest=false)
    if latest
      "<script src='https://cdn.html-first.com/mini-0.7.4.js'></script>
      <link   href='https://cdn.html-first.com/base-styles-0.0.14.css' rel='stylesheet'>
      <link   href='https://cdn.html-first.com/litewind-0.0.14.css' rel='stylesheet'>"
    else
      "<script src='/assets/vendor/minijs/0.7.4.js'></script>
      <link   href='/assets/vendor/base-styles/0.0.14.css' rel='stylesheet'>
      <link   href='/assets/vendor/litewind/2.0.1.css' rel='stylesheet'>"
    end
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(
        hard_wrap: true,
        fenced_code_blocks: true,
      ),
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
      tables: true,
      strikethrough: true
    )
    html = markdown.render(text)

    # Post-process to add target="_blank" only to external links
    # Use regex to find and modify only external link tags, preserving all formatting
    html.gsub!(/<a\s+([^>]*href=["'](https?:\/\/|\/\/)[^"']*["'][^>]*?)(\s*\/?>)/i) do |match|
      # Check if target already exists
      if match =~ /target\s*=\s*["']/
        match
      else
        # Insert target="_blank" before the closing > or />
        match.sub(/(\s*\/?>)$/, ' target="_blank"\1')
      end
    end

    html
  end

  def inline_svg(name, **options)
    # Correctly resolve the path to the SVG file within the 'website' directory
    path = File.join(settings.public_folder, name)

    # Check if the file exists before attempting to read it
    if File.exist?(path)
      svg = File.read(path)

      # If no additional options are provided, return the raw SVG content
      return svg if options.empty?

      # If options are present, parse the SVG and add them as attributes
      doc = Nokogiri::HTML::DocumentFragment.parse(svg)
      svg_node = doc.at_css('svg')
      options.each { |key, value| svg_node[key.to_s] = value }

      # Return the modified SVG as a string
      doc.to_html
    else
      # Return a placeholder or raise an error if the file doesn't exist
      "(SVG not found: #{name})"
    end
  end

end