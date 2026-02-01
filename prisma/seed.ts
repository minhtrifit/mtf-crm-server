import { Faker, vi, en, base } from '@faker-js/faker';
import { prisma } from '../src/libs/prisma';
import { hashPassword } from '../src/libs/auth';
import { Role } from '../src/models/User';

const faker = new Faker({
  locale: [vi, en, base]
});

async function main() {
  const password = await hashPassword('123456');

  const baseUsers = [
    {
      email: 'admin@gmail.com',
      password,
      fullName: 'Admin',
      role: Role.ADMIN,
      isActive: true
    }
  ];

  const generatedUsers = Array.from({ length: 99 }).map(() => {
    const firstName = faker.person.firstName();
    const lastName = faker.person.lastName();

    return {
      email: faker.internet
        .email({
          firstName,
          lastName,
          provider: 'gmail.com'
        })
        .toLowerCase(),
      password,
      fullName: `${lastName} ${firstName}`,
      phone: faker.helpers.arrayElement(['0' + faker.string.numeric(9), null]),
      address: faker.helpers.arrayElement([faker.location.streetAddress(), null]),
      role: Role.USER,
      isActive: faker.datatype.boolean()
    };
  });

  // Seed user
  await prisma.user.createMany({
    data: [...baseUsers, ...generatedUsers],
    skipDuplicates: true
  });

  console.log('✅ Seed successfully');
}

main()
  .catch((e) => {
    console.error('❌ Seed failed:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
