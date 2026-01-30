import { Server, Socket } from 'socket.io';
import { initSocketEmitter } from './socket.emitter';
import { registerOrderEvents } from './order.socket';

export const registerSocketEvents = (io: Server) => {
  // Init emitter
  initSocketEmitter(io);

  io.on('connection', (socket: Socket) => {
    console.log('Socket client connected:', socket.id);

    // Register event
    registerOrderEvents(io, socket);

    socket.on('disconnect', () => {
      console.log('Socket client disconnected:', socket.id);
    });
  });
};
