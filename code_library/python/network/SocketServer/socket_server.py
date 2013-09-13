# -*- coding:utf-8 -*-
#
# SocketServer 模块包含了4个基本的类： 针对TCP套接字流的TCPServer; 针对UDP数据套接字的UDPServer,
# 以及针对性不强的UnixStreamServer和UnixDatagramServer.
#
# 为了写一个使用SocketServer框架的服务器， 大部分代码会在一个请求处理程序中(request handler).
# 每当服务器收到一个请求（来自客户端的连接）时，就会实例化一个请求处理程序。
# 并且它的各种处理方法 (handler method) 会在处理请求时被调用。 具体调用哪个3方法取决于特定的服务器和使用的处理程序类(handler class).
# 这样可以把它们子类化， 使得服务器调用自定义的处理程序集。 基本的BaseRequestHandelr类把所有的操作都放到了处理器一个叫做handle的方法中，
# 这个方法会被服务器调用。 然后这个方法就会访问属性self.request 中的客户端套接字。
# 如果使用的是流， 那么可以使用StreamRequestHander类。 创建了其他两个新属性， self.rfile(用于读取) 和self.wfile(用于写入).
#
# SocketServer 框架中其他类实现了对HTTP服务器的基本支持。 其中包括运行CGI脚本， 也包括对XML RPC的支持。

from SocketServer import TCPServer, StreamRequestHandler

class Handler(StreamRequestHandler):
    def handle(self):
        addr = self.request.getpeername()
        print 'Got connect from' , addr
        self.wfile.write('Thank you for connectiong')

server = TCPServer(('', 1234), Handler)
server.serve_forever()


