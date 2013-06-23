# -*- coding: utf-8 -*-

Plugin.create(:mikutter_hattori) do
  command(
          :mikutter_hattori,
          name: '服部',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    to_name = opt.messages[0].user.idname
    greets = ["あかんて", "せやかて", "どないしてん", "おう", "せや","ところで",
              "まて", "大丈夫か", "ほれ", "どこいくねん", "元気か", "こら",
              "なあ", "ひさしぶりやな", "なあ", "ええぞ",
              "動くな", "心配すんな", "オレや"]
    postfix = ["！", "…"]
    msg = ""
    n_msg = ""
    while TRUE do
      n_msg  = greets.sample
      n_msg += "@"+to_name if rand > 0.5
      n_msg += postfix.sample
      break if msg.split(//).size + n_msg.split(//).size >= 140
      msg += n_msg
    end
    Service.primary.post(:message => msg,
                         :replyto => opt.messages[0])
  end
end

