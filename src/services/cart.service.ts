import { prisma } from '@/libs/prisma';
import { AddToCartPayload, RemoveCartItemPayload, UpdateCartItemQuantityPayload } from '@/models/Cart';
import { ProductError } from './product.service';
import { AuthError } from './auth.service';

export enum CartError {
  ITEM_NOT_FOUND = 'CART_ITEM_NOT_FOUND',
  INVALID_QUANTITY = 'INVALID_QUANTITY',
  QUANTITY_GREATER_THAN_ZERO = 'QUANTITY_GREATER_THAN_ZERO'
}

export const cartService = {
  async getCartByUserId(userId: string) {
    const user = await prisma.user.findUnique({
      where: { id: userId }
    });

    if (!user) throw new Error(AuthError.NOT_FOUND);

    return prisma.cart.findUnique({
      where: { userId },
      include: {
        items: {
          include: {
            product: true
          },
          orderBy: {
            createdAt: 'desc'
          }
        }
      }
    });
  },

  async addToCart(userId: string, payload: AddToCartPayload) {
    return prisma.$transaction(async (tx) => {
      const { productId, quantity } = payload;

      let cart = await tx.cart.findUnique({
        where: { userId }
      });

      if (!cart) {
        cart = await tx.cart.create({
          data: { userId }
        });
      }

      const existedItem = await tx.cartItem.findUnique({
        where: {
          cartId_productId: {
            cartId: cart.id,
            productId
          }
        }
      });

      const newQuantity = (existedItem?.quantity ?? 0) + quantity;

      const product = await tx.product.findUnique({
        where: { id: productId },
        include: {
          category: {
            select: {
              id: true,
              name: true,
              slug: true,
              imageUrl: true,
              isActive: true
            }
          }
        }
      });

      if (!product) throw new Error(ProductError.NOT_FOUND);

      if (newQuantity > product.stock) throw new Error(CartError.INVALID_QUANTITY);

      if (existedItem) {
        await tx.cartItem.update({
          where: { id: existedItem.id },
          data: { quantity: newQuantity }
        });
      } else {
        await tx.cartItem.create({
          data: {
            cartId: cart.id,
            productId,
            quantity
          }
        });
      }

      return tx.cart.findUnique({
        where: { id: cart.id },
        include: {
          items: {
            include: {
              product: true
            }
          }
        }
      });
    });
  },

  async updateCartItemQuantity(userId: string, payload: UpdateCartItemQuantityPayload) {
    const { cartItemId, quantity } = payload;

    const cartItem = await prisma.cartItem.findFirst({
      where: {
        id: cartItemId,
        cart: {
          userId
        }
      },
      include: {
        product: true
      }
    });

    if (!cartItem) throw new Error(CartError.ITEM_NOT_FOUND);

    if (quantity <= 0) {
      await prisma.cartItem.delete({
        where: {
          id: cartItem.id
        }
      });

      return prisma.cart.findUnique({
        where: {
          userId
        },
        include: {
          items: {
            include: {
              product: true
            },
            orderBy: {
              createdAt: 'desc'
            }
          }
        }
      });
    }

    if (!cartItem.product.isActive) throw new Error(ProductError.NOT_FOUND);

    if (quantity > cartItem.product.stock) throw new Error(CartError.INVALID_QUANTITY);

    await prisma.cartItem.update({
      where: {
        id: cartItem.id
      },
      data: {
        quantity
      }
    });

    return prisma.cart.findUnique({
      where: {
        userId
      },
      include: {
        items: {
          include: {
            product: true
          },
          orderBy: {
            createdAt: 'desc'
          }
        }
      }
    });
  },

  async removeCartItem(userId: string, payload: RemoveCartItemPayload) {
    const { cartItemId } = payload;

    const cartItem = await prisma.cartItem.findFirst({
      where: {
        id: cartItemId,
        cart: {
          userId
        }
      },
      select: {
        id: true
      }
    });

    if (!cartItem) throw new Error(CartError.ITEM_NOT_FOUND);

    await prisma.cartItem.delete({
      where: {
        id: cartItem.id
      }
    });

    return prisma.cart.findUnique({
      where: {
        userId
      },
      include: {
        items: {
          include: {
            product: true
          },
          orderBy: {
            createdAt: 'desc'
          }
        }
      }
    });
  },

  async clearCart(userId: string) {
    const cart = await prisma.cart.findUnique({
      where: {
        userId
      },
      select: {
        id: true
      }
    });

    if (!cart) return null;

    return await prisma.cartItem.deleteMany({
      where: {
        cartId: cart.id
      }
    });
  }
};
