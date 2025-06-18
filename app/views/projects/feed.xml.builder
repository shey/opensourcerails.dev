xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "OSR – Recent Projects"
    xml.link root_url
    xml.description "Recently added open-source Ruby on Rails projects"
    xml.language "en-ca"
    xml.ttl 1440
    xml.pubDate @projects.first&.created_at&.rfc2822.to_s

    @projects.each do |project|
      html_description = markdown(project.summary_for_feed)

      xml.item do
        xml.title project.name
        xml.description { xml.cdata! html_description }
        xml.link project_url(project)
        xml.pubDate project.created_at.rfc2822
        xml.guid project_url(project)
      end
    end
  end
end
