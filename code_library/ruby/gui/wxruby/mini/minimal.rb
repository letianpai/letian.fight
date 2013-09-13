#!/usr/bin/evn ruby
# coding: utf-8

##
#
#

require "wx"

##
#  主App
#
class Minimal < Wx::App
    def on_init()
        MyFrame.new("标题。。标题")   
    end
end

##
#  主Frame
##
class MyFrame < Wx::Frame
    # 初始化 Frame
    def initialize(t)
        #super(nil, title: t, style:Wx::DEFAULT_FRAME_STYLE & ~ (Wx::RESIZE_BOX|Wx::MAXIMIZE_BOX|Wx::SYSTEM_MENU|Wx::ICONIZE|Wx::CAPTION) )
        super(nil, title: t, style:Wx::DEFAULT_FRAME_STYLE ,size: [800,600] )
        # 建立 菜单
        fileMenu = Wx::Menu.new
        fileMenu.append(Wx::ID_EXIT, "E&xit\tAlt-x", "Quit this program")
        
        helpMenu = Wx::Menu.new   
        helpMenu.append(Wx::ID_ABOUT,"&About...\tF1", "Show about dialog")

        # 菜单条
        menuBar = Wx::MenuBar.new
        menuBar.append(fileMenu, "&文件")
        menuBar.append(helpMenu, "&帮助")
        set_menu_bar(menuBar)

        # 状态栏
        create_status_bar(2)
        set_status_text("静态条文字")

        # 映射事件
        evt_menu(Wx::ID_ABOUT) {|event| on_about(event)}
        evt_menu(Wx::ID_EXIT)  {|event| on_quit(event)}

        show
    end

    ### 事件处理
    ##
    # 退出事件
    def on_quit(event)
       close(true)
    end

    ##
    # 点选 about
    def on_about(event)
       Wx::message_box("欢迎使用这个sample, 这个sample是minimal.\n 一个最小的wcRuby 例子。", "标题", Wx::OK | Wx::ICON_INFORMATION)
    end
end

Minimal.new.main_loop


