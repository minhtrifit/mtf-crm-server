import { Server } from 'socket.io';

let io: Server | null = null;

export const initSocketEmitter = (_io: Server) => {
  io = _io;
};

const ensureIO = () => {
  if (!io) {
    throw new Error('Socket.IO not initialized');
  }
};

export const socketEmit = {
  toAdmin(event: string, payload: any) {
    ensureIO();
    io!.to('admin').emit(event, payload);
  },

  toTable(tableId: string, event: string, payload: any) {
    ensureIO();
    io!.to(`table:${tableId}`).emit(event, payload);
  },

  broadcast(event: string, payload: any) {
    ensureIO();
    io!.emit(event, payload);
  }
};
