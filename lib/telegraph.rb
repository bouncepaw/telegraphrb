# coding: utf-8
%w(http json awesome_print).each { |f| require f }

# do you like my badass align?
module Telegraph
  def Telegraph.post(method)
    puts "Got method: #{method}"

    # From JSON string to Ruby hash
    data = JSON.parse(HTTP.post("https://api.telegra.ph/#{method}")
      .to_s.gsub(/\\u([0-9a-fA-F]{4})/) { |m| [$1.hex].pack("U") }
    )

    # Replace string keys with symbols
    data.keys.each do |key|
      data[(key.to_sym rescue key) || key] = data.delete key
    end

    # Replace other string keys with symbols
    data[:result].keys.each do |key|
      data[:result][(key.to_sym rescue key) || key] = data[:result].delete key
    end

    ap data
    data
  end

  def Telegraph.create_account(r)
    method =  "createAccount?short_name=#{r[:short_name]}"
    method << "&author_name=#{r[:author_name]}" if r[:author_name]
    method << "&author_url=#{r[:author_url]}"   if r[:author_url]

    Telegraph.post method
  end

  def Telegraph.edit_account_info(r)
    method =  "editAccountInfo?access_token=#{r[:access_token]}"
    method << "&short_name=#{r[:short_name]}"   if r[:short_name]
    method << "&author_name=#{r[:author_name]}" if r[:author_name]
    method << "&author_url=#{r[:author_url]}"   if r[:author_url]

    Telegraph.post method
  end

  def Telegraph.get_account_info(r)
    method =  "getAccountInfo?access_token=#{r[:access_token]}"
    method << "&fields=#{r[:fields]}" if r[:fields]

    Telegraph.post method
  end

  def Telegraph.revoke_access_token(r)
    method = "revokeAccessToken?access_token=#{r[:access_token]}"

    Telegraph.post method
  end

  def Telegraph.create_page(r)
    method =  "createPage?access_token=#{r[:access_token]}"
    method << "&title=#{r[:title]}"
    method << "&author_name=#{r[:author_name]}"       if r[:author_name]
    method << "&author_url=#{r[:author_url]}"         if r[:author_url]
    method << "&content=#{r[:content]}"
    method << "&return_content=#{r[:return_content]}" if r[:return_content]

    Telegraph.post method
  end

  def Telegraph.edit_page(r)
    method =  "editPage/#{r[:path]}?access_token=#{r[:access_token]}"
    method << "&title=#{r[:title]}"
    method << "&content=#{r[:content]}"
    method << "&author_name=#{r[:author_name]}"       if r[:author_name]
    method << "&author_url=#{r[:author_url]}"         if r[:author_url]
    method << "&return_content=#{r[:return_content]}" if r[:return_content]

    Telegraph.post method
  end

  def Telegraph.get_page(r)
    method =  "getPage/#{r[:path]}"
    method << "&return_content=#{r[:return_content]}" if r[:return_content]

    Telegraph.post method
  end

  def Telegraph.get_page_list(r)
    method =  "getPageList?access_token=#{r[:access_token]}"
    method << "&offset=#{r[:offset]}" if r[:offset]
    method << "&limit=#{r[:limit]}"   if r[:limit]

    Telegraph.post method
  end

  def Telegraph.get_views(r)
    method =  "getViews/#{r[:path]}"
    method << "?year=#{r[:year]}"   if r[:year]
    method << "&month=#{r[:month]}" if r[:month]
    method << "&day=#{r[:day]}"     if r[:day]
    method << "&hour=#{r[:hour]}"   if r[:hour]

    Telegraph.post method
  end

  # Method with names as in API
  class << self # :C
    alias :createAccount     :create_account
    alias :createPage        :create_page
    alias :editAccountInfo   :edit_account_info
    alias :editPage          :edit_page
    alias :getAccountInfo    :get_account_info
    alias :getPage           :get_page
    alias :getPageList       :get_page_list
    alias :getViews          :get_views
    alias :revokeAccessToken :revoke_access_token
  end
end

