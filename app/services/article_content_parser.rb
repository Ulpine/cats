class ArticleContentParser
  def self.parse(raw_content)
    return "" if raw_content.blank?

    sections = raw_content.split("\n\n")
    content = []

    # Extraire l'introduction
    introduction = sections.shift
    content << "<div class='article-meta'></div>" # Pour le temps de lecture
    content << "<p class='introduction'>#{introduction}</p>" if introduction

    sections.each do |section|
      case section
        when /^(\d+\.)\s*(.+)/  # Matches "1. Title"
          title = $2.strip
          content << "<h2 id='section-#{content.length}'>#{title}</h2>"

        when /^([a-z])\)\s*(.+)/  # Matches "a) Subtitle"
          subtitle = $2.strip
          content << "<h3>#{subtitle}</h3>"

        when /^(.+?)\s*:\s*(.+)/  # Matches "Label: Content"
          label, text = $1.strip, $2.strip
          content << %Q{<div class="info-box">#{label} : #{text}</div>}

        else
          if section.strip.length > 0
            content << "<p>#{section.strip}</p>"
          end
      end
    end

    # Structure complète avec les classes nécessaires
    <<-HTML
      <div class="article-show">
        <div class="article-hero"></div>
        <div class="container">
          <article class="article-content">
            <div class="article-body">
              #{content.join("\n")}
            </div>
          </article>
        </div>
      </div>
    HTML
  end

  def self.extract_summary(raw_content, length: 150)
    return "" if raw_content.blank?
    paragraphs = raw_content.split("\n\n")
    content_paragraph = paragraphs.find { |p| !p.match?(/^(\d+\.|[a-z]\))/) }
    content_paragraph.to_s.truncate(length)
  end
end
