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

  const generatedUsers = Array.from({ length: 100 }).map(() => {
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

  const categories = [
    {
      name: 'Quần áo',
      slug: 'quan-ao',
      imageUrl: 'http://localhost:5000/uploads/1767709707010-368704716.jpeg'
    },
    {
      name: 'Giày dép',
      slug: 'giay-dep',
      imageUrl: 'http://localhost:5000/uploads/1767709790246-255183333.jpg'
    },
    {
      name: 'Túi xách & balo',
      slug: 'tui-xach-balo',
      imageUrl: 'http://localhost:5000/uploads/1767709841818-961857427.jpeg'
    },
    {
      name: 'Đồ ăn & thực phẩm',
      slug: 'do-an-thuc-pham',
      imageUrl: 'http://localhost:5000/uploads/1767709908928-551974324.jpg'
    },
    {
      name: 'Đồ uống',
      slug: 'do-uong',
      imageUrl: 'http://localhost:5000/uploads/1767710043763-532474989.jpg'
    },
    {
      name: 'Đồ gia dụng',
      slug: 'do-gia-dung',
      imageUrl: 'http://localhost:5000/uploads/1767710094853-36920672.jpg'
    },
    {
      name: 'Mỹ phẩm',
      slug: 'my-pham',
      imageUrl: 'http://localhost:5000/uploads/1767710142855-792341148.jpg'
    },
    {
      name: 'Đồ điện tử',
      slug: 'do-dien-tu',
      imageUrl: 'http://localhost:5000/uploads/1767710194839-72527983.jpeg'
    },
    {
      name: 'Sách & văn phòng phẩm',
      slug: 'sach-van-phong-pham',
      imageUrl: 'http://localhost:5000/uploads/1767710264341-547660271.jpg'
    },
    {
      name: 'Đồ thể thao',
      slug: 'do-the-thao',
      imageUrl: 'http://localhost:5000/uploads/1767710307649-386537669.jpg'
    }
  ];

  // Seed user
  await prisma.user.createMany({
    data: [...baseUsers, ...generatedUsers],
    skipDuplicates: true
  });

  // Seed category
  await prisma.category.createMany({
    data: categories,
    skipDuplicates: true // tránh lỗi unique khi seed lại
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
