import getUserId from '../utils/getUserId';

const Subscription = {
  // This is left hear as an example to follow
  // myPost: {
  //   subscribe(parent, args, { prisma, request }, info) {
  //     const userId = getUserId(request);
  //     return prisma.subscription.post({
  //       where: {
  //         node: {
  //           author: {
  //             id: userId,
  //           },
  //         },
  //       },
  //     });
  //   },
  // },
};

export default Subscription;
