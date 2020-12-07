import { Prisma, Activity, PrismaClient } from "@prisma/client";

async function main() {
  const prisma = new PrismaClient();
  // For reference
  //
  //model Activity {
  //id             Int      @id @default(autoincrement())
  //uuid           String   @default(uuid())
  //tripId         Int
  //activityTypeId Int
  //name           String
  //description    String?
  //location       String
  //date           DateTime
  //timezone       String
  //public         Boolean
  //maxPeople      Int?     @default(0)
  //createdAt      DateTime @default(now())
  //updatedAt      DateTime @updatedAt

  //trip         Trip                @relation(fields: [tripId], references: [id])
  //activityType ActivityType        @relation(fields: [activityTypeId], references: [id])
  //users        UsersToActivities[]

  //@@unique([tripId, id])
  //}

  const activities = [
    {
      name: "Activity1",
      description: "This is activity 1",
      location: "Some location",
      date: new Date(),
      public: false,
      timezone: "Europe/Berlin",
      maxPeople: 1,
      activityTypeId: 1,
      tripId: 1,
    },
  ];

  const createActivities:
    | Prisma.ActivityUncheckedCreateWithoutTripInput[]
    | undefined = activities?.map(
    ({
      name,
      description,
      location,
      date,
      timezone,
      public: publicActivity,
      maxPeople,
      activityTypeId,
    }) => ({
      name,
      description,
      location,
      date,
      timezone,
      public: publicActivity,
      maxPeople,
      activityTypeId, // not workin1
    })
  );

  //model Trip {
  //id            Int      @id @default(autoincrement())
  //uuid          String   @default(uuid())
  //userId        Int
  //name          String
  //description   String?
  //public        Boolean
  //dateFrom      DateTime
  //dateTo        DateTime
  //adults        Int
  //children      Int?     @default(0)
  //infants       Int?     @default(0)
  //backgroundUrl String?
  //createdAt     DateTime @default(now())
  //updatedAt     DateTime @updatedAt

  //user       User       @relation(fields: [userId], references: [id])
  //activities Activity[]

  //@@unique([userId, id])
  //}

  const trip = {
    name: "Trip 1",
    description: "This is a description",
    public: false,
    dateFrom: new Date(),
    dateTo: new Date(),
    adults: 12,
    backgroundUrl: "https://duckduckgo.com",
  };

  const data = await prisma.trip.create({
    data: {
      ...trip,
      userId: 1,
      activities: {
        create: createActivities,
      },
    },
  });

  console.log(data);
  prisma.$disconnect();
}

main();
