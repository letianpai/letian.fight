#!/usr/bin/env ruby
# coding: utf-8

##
#  测试boxsizer 布局
##
require 'wx'
include  Wx

##
#  应用程序类
#
class BoxApp < Wx::App
   def on_init()
      BoxFrame.new().show()
   end
end

class BoxFrame < Frame
   def initialize()
       super(nil, title: "标题内容" ,style: DEFAULT_FRAME_STYLE, size: [600, 480])

       # 定义基本
       topSizer = BoxSizer.new(VERTICAL)
       topSizer.add(TextCtrl.new(self, ID_ANY, "内容", pos: DEFAULT_POSITION, size:[300, 90], style: TE_MULTILINE),
                     1,
                     EXPAND ,
                     10
                    )
       
       buttonSizer = BoxSizer.new(HORIZONTAL)
       buttonSizer.add(Button.new(self, ID_OK, "OK"), 0 , ALL, 10)
       buttonSizer.add(Button.new(self, ID_CANCEL, "Cancel"), 0, ALL, 10)

       topSizer.add(buttonSizer, 0, ALIGN_CENTER)

       set_sizer(topSizer)
       topSizer.fit(self)
       topSizer.set_size_hints(self)

   end
end

BoxApp.new.main_loop

