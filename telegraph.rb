# coding: utf-8
%w(http).each { |f| require f }

# do you like my badass align?
module Telegraph
  def Telegraph.post(method)
    puts "Got method: #{method}"
    HTTP.post("https://api.telegra.ph/#{method}")
      .to_s.gsub(/\\u([0-9a-fA-F]{4})/) { |m| [$1.hex].pack("U") }
  end

  def Telegraph.create_account(request)
    short_name  = request[:short_name] # required
    author_name = request[:author_name]
    author_url  = request[:author_url]

    method =  "createAccount?short_name=#{short_name}"
    method << "&author_name=#{author_name}" unless author_name.nil?
    method << "&author_url=#{author_url}"   unless author_name.nil?

    Telegraph.post method
  end

  def Telegraph.edit_account_info(request)
    access_token = request[:access_token] # required
    short_name   = request[:short_name]
    author_name  = request[:author_name]
    author_url   = request[:author_url]

    method =  "editAccountInfo?access_token=#{access_token}"
    method << "&short_name=#{short_name}"   unless short_name.nil?
    method << "&author_name=#{author_name}" unless author_name.nil?
    method << "&author_url=#{author_url}"   unless author_url.nil?

    Telegraph.post method
  end

  def Telegraph.get_account_info(request)
    access_token = request[:access_token] # required
    fields       = request[:fields]

    method =  "getAccountInfo?access_token=#{access_token}"
    method << "&fields=#{fields}" unless fields.nil?

    Telegraph.post method
  end

  def Telegraph.revoke_access_token(request)
    access_token = request[:access_token] # required

    method = "revokeAccessToken?access_token=#{access_token}"

    Telegraph.post method
  end

  def Telegraph.create_page(request)
    access_token   = request[:access_token] # required
    title          = request[:title]        # required
    author_name    = request[:author_name]
    author_url     = request[:author_url]
    content        = request[:content]      # required
    return_content = request[:return_content]

    method =  "createPage?access_token=#{access_token}"
    method << "&title=#{title}"
    method << "&author_name=#{author_name}"       unless author_name.nil?
    method << "&author_url=#{author_url}"         unless author_url.nil?
    method << "&content=#{content}"
    method << "&return_content=#{return_content}" unless return_content.nil?

    Telegraph.post method
  end

  def Telegraph.edit_page(request)
    access_token   = request[:access_token] # required
    path           = request[:path]         # required
    title          = request[:title]        # required
    content        = request[:content]      # required
    author_name    = request[:author_name]
    author_url     = request[:author_url]
    return_content = request[:return_content]

    method =  "editpage/#{path}?access_token=#{access_token}"
    method << "&title=#{title}"
    method << "&content=#{content}"
    method << "&author_name=#{author_name}"       unless author_name.nil?
    method << "&author_url=#{author_url}"         unless author_url.nil?
    method << "&return_content=#{return_content}" unless return_content.nil?

    Telegraph.post method
  end

  def Telegraph.get_page(request)
    path           = request[:path] # required
    return_content = request[:return_content]

    method =  "getPage/#{path}"
    method << "&return_content=#{return_content}" unless return_content.nil?

    Telegraph.post method
  end

  def Telegraph.get_page_list(request)
    access_token = request[:access_token] # required
    offset       = request[:offset]
    limit        = request[:limit]

    method =  "getPageList?access_token=#{access_token}"
    method << "&offset=#{offset}" unless offset.nil?
    method << "&limit=#{limit}"   unless limit.nil?

    Telegraph.post method
  end

  def Telegraph.get_views(request)
    path  = request[:path] # required
    year  = request[:year]
    month = request[:month]
    day   = request[:day]
    hour  = request[:hour]

    method =  "getViews/#{path}"
    method << "?year=#{year}"   unless year.nil?
    method << "&month=#{month}" unless month.nil?
    method << "&day=#{day}"     unless day.nil?
    method << "&hour=#{hour}"   unless hour.nil?

    Telegraph.post method
  end
end

puts Telegraph.get_views({
  :path  => "Besit-11-Dvernye-ruchki-05-28"
})