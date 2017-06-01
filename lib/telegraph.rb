# coding: utf-8
require "http"

# do you like my badass align?
module Telegraph
  def Telegraph.post(method)
    puts "Got method: #{method}"
    puts HTTP.post("https://api.telegra.ph/#{method}")
      .to_s.gsub(/\\u([0-9a-fA-F]{4})/) { |m| [$1.hex].pack("U") }
  end

  def Telegraph.create_account(request)
    short_name  = request[:short_name] # required
    author_name = request[:author_name]
    author_url  = request[:author_url]

    method =  "createAccount?short_name=#{short_name}"
    method << "&author_name=#{author_name}" if author_name
    method << "&author_url=#{author_url}"   if author_name

    Telegraph.post method
  end

  def Telegraph.edit_account_info(request)
    access_token = request[:access_token] # required
    short_name   = request[:short_name]
    author_name  = request[:author_name]
    author_url   = request[:author_url]

    method =  "editAccountInfo?access_token=#{access_token}"
    method << "&short_name=#{short_name}"   if short_name
    method << "&author_name=#{author_name}" if author_name
    method << "&author_url=#{author_url}"   if author_url

    Telegraph.post method
  end

  def Telegraph.get_account_info(request)
    access_token = request[:access_token] # required
    fields       = request[:fields]

    method =  "getAccountInfo?access_token=#{access_token}"
    method << "&fields=#{fields}" if fields

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
    method << "&author_name=#{author_name}"       if author_name
    method << "&author_url=#{author_url}"         if author_url
    method << "&content=#{content}"
    method << "&return_content=#{return_content}" if return_content

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
    method << "&author_name=#{author_name}"       if author_name
    method << "&author_url=#{author_url}"         if author_url
    method << "&return_content=#{return_content}" if return_content

    Telegraph.post method
  end

  def Telegraph.get_page(request)
    path           = request[:path] # required
    return_content = request[:return_content]

    method =  "getPage/#{path}"
    method << "&return_content=#{return_content}" if return_content

    Telegraph.post method
  end

  def Telegraph.get_page_list(request)
    access_token = request[:access_token] # required
    offset       = request[:offset]
    limit        = request[:limit]

    method =  "getPageList?access_token=#{access_token}"
    method << "&offset=#{offset}" if offset
    method << "&limit=#{limit}"   if limit

    Telegraph.post method
  end

  def Telegraph.get_views(request)
    path  = request[:path] # required
    year  = request[:year]
    month = request[:month]
    day   = request[:day]
    hour  = request[:hour]

    method =  "getViews/#{path}"
    method << "?year=#{year}"   if year
    method << "&month=#{month}" if month
    method << "&day=#{day}"     if day
    method << "&hour=#{hour}"   if hour

    Telegraph.post method
  end
end

