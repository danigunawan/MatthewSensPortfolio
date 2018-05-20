module ApplicationHelper

  def login_helper style = ""
     if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      "&nbsp;".html_safe +
      (link_to "Login", new_user_session_path, class: style)
     else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
     end
  end

  def sample_helper
    content_tag(:div, "My Content", class: "my class")
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting" )
    end
  end

  def copyright_generator
    SensPortfolioViewTool::Renderer.copyright 'Matthew Israelson', 'All rights reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      # {
      #   url: about_me_path,
      #   title: 'About Me'
      # },
      # {
      #   url: contact_path,
      #   title: 'Contact'
      # },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
    ]
  end

  #style is the css style
  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}<a/></#{tag_type}>" + "&nbsp;&nbsp;"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    # sets variable to three diff types of alerts, so alert will not be equal to one of these if they return true
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Matthew Israelson Portfolio", sticky: false, time: 2000)
  end

end

# nav_links = <<NAV
# <#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path}">Home<a/></#{tag_type}>
# <#{tag_type}><a href="#{about_me_path}" class="#{style} #{active? about_me_path}">About Me<a/></#{tag_type}>
# <#{tag_type}><a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact<a/></#{tag_type}>
# <#{tag_type}><a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blog<a/></#{tag_type}>
# <#{tag_type}><a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Portfolio<a/></#{tag_type}>
# NAV
#   nav_links.html_safe
