class WechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#wechat_responder---rails-responder-controller-dsl
  wechat_responder
  layout 'wechat'

  def message_box
  end

  def direct_message_box
    render 'weui/message_box', locals: { title: 'Weui', description: 'directly render in controller' }
  end

  on :text do |request, content|
    request.reply.text '欢迎使用，请输入“注册”成为我们的一员。'
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
    "欢迎使用！\n点击进入：<a href=\"http://sagittarius.cheshipin.tv/api/users/home?openid=#{request[:FromUserName]}\">注册页面</a> "
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
  on :click, with: 'MY_WENDAO' do |request, key|
    # request.reply.text "http://wendao.easybird.cn/results/my_videos?user=#{request[:FromUserName]}"
    request.reply.text "欢迎使用君悦闻道！\n请在对话框输入关键词搜索内容。\n点击进入：<a href=\"http://wendao.easybird.cn/results/my_videos?user=#{request[:FromUserName]}\">我的闻道</a> "
  end

  # When unsubscribe user scan qrcode qrscene_xxxxxx to subscribe in public account
  # notice user will subscribe public account at same time, so wechat won't trigger subscribe event any more
  on :scan, with: 'qrscene_xxxxxx' do |request, ticket|
    request.reply.text "Unsubscribe user #{request[:FromUserName]} Ticket #{ticket}"
  end

  # When subscribe user scan scene_id in public account
  on :scan, with: 'scene_id' do |request, ticket|
    request.reply.text "Subscribe user #{request[:FromUserName]} Ticket #{ticket}"
  end

  # When no any on :scan responder can match subscribe user scaned scene_id
  on :event, with: 'scan' do |request|
    if request[:EventKey].present?
      request.reply.text "event scan got EventKey #{request[:EventKey]} Ticket #{request[:Ticket]}"
    end
  end

  # When enterprise user press menu BINDING_QR_CODE and success to scan bar code
  on :scan, with: 'BINDING_QR_CODE' do |request, scan_result, scan_type|
    request.reply.text "User #{request[:FromUserName]} ScanResult #{scan_result} ScanType #{scan_type}"
  end

  # When user view URL in the menu button
  on :view, with: 'http://wendao.easybird.cn/results/my_videos' do |request, view|
    request.reply.text "#{request[:FromUserName]} view #{view}"
  end

  # When user sent the imsage
  on :image do |request|
    request.reply.image(request[:MediaId]) # Echo the sent image to user
  end

  # When user sent the voice
  on :voice do |request|
    request.reply.voice(request[:MediaId]) # Echo the sent voice to user
  end

  # When user sent the video
  on :video do |request|
    nickname = wechat.user(request[:FromUserName])['nickname'] # Call wechat api to get sender nickname
    request.reply.video(request[:MediaId], title: 'Echo', description: "Got #{nickname} sent video") # Echo the sent video to user
  end

  # When user sent location
  on :location do |request|
    request.reply.text("Latitude: #{message[:Latitude]} Longitude: #{message[:Longitude]} Precision: #{message[:Precision]}")
  end

  on :event, with: 'unsubscribe' do |request|
    request.reply.success # user can not receive this message
  end

  # When user enter the app / agent app
  on :event, with: 'enter_agent' do |request|
    request.reply.text "#{request[:FromUserName]} enter agent app now"
  end

  on :event do |request|
    logger.info request.inspect
    if request[:CardId].present?
      request.reply.text "CardId: #{request[:CardId]}, Event: #{request[:Event]}"
    end
  end

  # Any not match above will fail to below
  on :fallback, respond: 'fallback message'

end
