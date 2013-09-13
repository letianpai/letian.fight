# coding: utf-8

require "wx"
include Wx

module MiniConf
   DARK_CHOICK = ["咖啡", "茶", "果汁", "牛奶"] 
end

class MinimalApp < Wx::App
    def on_init
        MyFrame.new
    end
end


##
#  主Frame
##
class MyFrame < Frame
    
    ##
    #  MyFrame 的构造函数
    #
    def initialize
       super(nil, title:  "RedioBox 例子",  #标题
                  pos:    [150, 25],        # 位置， 默认 DEFAULT_POSITION
                  size:   [300, 200]      # 大小， 默认 DEFAULT_SIZE

                  # 对于位置和大小参数， 不需要指定Point 和Size 对象，
                  # see: wxRuby 覆盖这里 doc page wxruby_intro.html
       )

       panel = Panel.new(self)   # Parent = self = this Frame

       drink_choices = MiniConf::DARK_CHOICK  # radio button 的label
       #include MiniConf
       
       radios = Wx::RadioBox.new(
             panel,   #Parent panel
             label: "饮料",  # 包围 radio 按钮的 box 的 label
             pos:   [20, 5],
             size:  Wx::DEFAULT_SIZE,
             choices: drink_choices,   # radio buttons 的 labels
             major_dimension: 1,       # 列最大数量, 可以尝试修改这个为2
             style: Wx::RA_SPECIFY_COLS  # major_dimension 值

             # :major_dimension 和 :style 组合起来决定RadioBox布局
             # 这里， 列最大数量为1， 意思是每一行只能有一个 radio button, 
             # 因为这里有4个radio button, 所以这里将会为 4行。 每一行一个radio button
       	)

       # 关联 radiobox 事件
       # 表示当一个类型为 evt_radiobox 的包含 id 为 radio.get_id() 的事件发生时，
       # 这个block 将会被调用， 并且 "event object " 被传递给 block, 这个block 调用方法 on_change_radio().
       # 并把event 对象传递给方法。 这个event 对象包含选择的radio button 相关信息
       evt_radiobox(radios.get_id()) {|cmd_event| on_change_radio(cmd_event) }

       # 定义一个静态文本
       @text_widget = Wx::StaticText.new(
           panel,    # Parent
           label: "",
           pos:   [150, 25],
           size:   Wx::DEFAULT_SIZE

           # 储存一个 widget 到一个实例变量，用于其它方法访问。
           # 比如下面的 on_change_radio..
       )
       show

    end
    
    # 修改radio box 的事件
    def on_change_radio(cmd_event)
       selected_drink = cmd_event.string # radio 的label 的string
       @text_widget.label = selected_drink
    end

end


MinimalApp.new.main_loop
