# -*- coding: utf-8 -*-
#
# 这里使用 SocketServer 进行分叉和线程进行处理
# 注意fork 不能在win平台下使用
#
# 在socketServer 中，如果handle 方法需要花很长时间完成。 那么分叉和线程行为就很有用。
#

# 使用分叉技术的服务器
from SocketServer import TCPServer, ForkingMixIn, StreamRequestHandler

class Server(ForkingMixIn, TCPServer): pass

class Handler(StreamRequestHandler):
    def handle(self):
        addr = self.request.getpeername()
        print 'Got connection from' , addr
        self.wfile.write('Thnak you for connecting')

server = Server(('', 1234), Handler)
server.serve_forever();

