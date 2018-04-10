class WechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#wechat_responder---rails-responder-controller-dsl
  wechat_api

  on :text do |request, content|
    request.reply.text '欢迎使用，请在对话框输入“注册”成为我们的一员。'
    # user = User.find_or_create_by(open_id: request[:FromUserName])
    #
    # if user
    #   message = user.messages.create(content: content)
    #   message.delay(:queue => 'sending').send_query(user.open_id, content) if message
    #   request.reply.text "您搜索的关键词: \"#{content}\"已收到，正在为您查询，稍后会为您推送结果。"
    # end
  end

  # When receive 'help', will trigger this responder
  on :text, with: '注册' do |request|
    openid = request[:FromUserName]
    request.reply.text "欢迎使用！\n点击进入：<a href=\"http://h5.shanghairunyan.com/main\">注册页面</a> "
  end

  # When receive '<n>news', will match and will got count as <n> as parameter
  # on :text, with: /^(\d+) news$/ do |request, count|
  #   # Wechat article can only contain max 10 items, large than 10 will dropped.
  #   news = (1..count.to_i).each_with_object([]) { |n, memo| memo << { title: 'News title', content: "No. #{n} news content" } }
  #   request.reply.news(news) do |article, n, index| # article is return object
  #     article.item title: "#{index} #{n[:title]}", description: n[:content], pic_url: 'http://www.baidu.com/img/bdlogo.gif', url: 'http://www.baidu.com/'
  #   end
  # end

  on :event, with: 'subscribe' do |request|
    # User.find_or_create_by(open_id: request[:FromUserName])
    request.reply.text '欢迎使用，请输入“注册”成为我们的一员。'
  end

  # When user click the menu button
  on :click, with: 'EVENTS_NEW' do |request, key|
    # request.reply.text "http://wendao.easybird.cn/results/my_videos?user=#{request[:FromUserName]}"
    openid = request[:FromUserName]
    articles = { "articles" => [] }
    events = Event.where(event_type: "new")
    events.each.with_index(1) do |event, index|
      articles["articles"] << {
        "title" => event.title,
        "description" => event.desc[0..100],
        "url" => "http://h5.shanghairunyan.com/active/detail/#{event.id}",
        "pic_url" => event.image.url
        }
      break if index == 8
    end

    wechat.custom_message_send Wechat::Message.to(openid).news(articles['articles'])
  end

  on :click, with: 'EVENTS_TG' do |request, key|
    # request.reply.text "http://wendao.easybird.cn/results/my_videos?user=#{request[:FromUserName]}"
    openid = request[:FromUserName]
    articles = { "articles" => [] }
    events = Event.where(event_type: "tg")
    events.each.with_index(1) do |event, index|
      articles["articles"] << {
        "title" => event.title,
        "description" => event.desc[0..100],
        "url" => "http://h5.shanghairunyan.com/active/detail/#{event.id}",
        "pic_url" => event.image.url
        }
      break if index == 8
    end
    wechat.custom_message_send Wechat::Message.to(openid).news(articles['articles'])
  end

  on :click, with: 'EVENTS_PROJECT' do |request, key|
    # request.reply.text "http://wendao.easybird.cn/results/my_videos?user=#{request[:FromUserName]}"
    openid = request[:FromUserName]
    articles = { "articles" => [] }
    events = Event.where(event_type: "project")
    events.each.with_index(1) do |event, index|
      articles["articles"] << {
        "title" => event.title,
        "description" => event.desc[0..100],
        "url" => "http://h5.shanghairunyan.com/active/detail/#{event.id}",
        "pic_url" => event.image.url
        }
      break if index == 8
    end
    wechat.custom_message_send Wechat::Message.to(openid).news(articles['articles'])
  end

  # Any not match above will fail to below
  on :fallback, respond: 'fallback message'

end
