"use client";
import React from "react";
import {
  Box,
  Button,
  List,
  ListItem,
  ListItemText,
  Typography,
} from "@mui/material";
import StatsCard from "../_components/Cards/stats";
import PhoneCard from "../_components/Cards/phone";
import Image from "next/image";
import DesktopCard from "../_components/Cards/desktop";

const alarmsList = [
  { id: 1, title: "Upcoming Alarm 1", description: "Description for alarm 1" },
  { id: 2, title: "Upcoming Alarm 2", description: "Description for alarm 2" },
  { id: 3, title: "Upcoming Alarm 3", description: "Description for alarm 3" },
  { id: 4, title: "Upcoming Alarm 4", description: "Description for alarm 4" },
  { id: 5, title: "Upcoming Alarm 5", description: "Description for alarm 5" },
  { id: 6, title: "Upcoming Alarm 6", description: "Description for alarm 6" },
  { id: 7, title: "Upcoming Alarm 7", description: "Description for alarm 7" },
];

const Dashboard: React.FC = () => {
  return (
    <>
      <Box display="flex" flexDirection={"row"}>
        <Box flex={6} height="100vh">
          <Box
            display="flex"
            justifyContent="space-between"
            alignItems="center"
            mb={1}
          >
            <Typography variant="h1">Hi, Juan</Typography>
          </Box>
          <Box>
            <Button variant="text" color="primary" sx={{ mr: 1 }}>
              Filters
            </Button>
          </Box>
          <Box>
            <Box
              display="flex"
              overflow="auto"
              whiteSpace="nowrap"
              mb={2}
              gap={2}
            >
              <StatsCard number={4} text="Total number of Alarms" width={350} />
              <StatsCard
                number={10}
                text="Total number of Reminders"
                width={350}
              />
            </Box>
          </Box>
          <br></br>
          <br></br>
          <br></br>
          <Box display="flex" flexDirection={"row"}>
            <Box flex={5}>
              <Box display="flex" mb={2}>
                <Typography variant="h4">Schedule</Typography>
              </Box>
              <Box display="flex" mb={2} position={"relative"}>
                <Image src="/stats.png" alt="Phone" width={380} height={350} />
              </Box>
            </Box>
            <Box flex={5}>
              <Box display="flex" mb={2}>
                <Typography variant="h4">Devices</Typography>
              </Box>
              <Box>
                <Box>
                  <DesktopCard />
                </Box>
                <Box display={"flex"}>
                  <PhoneCard />
                  <PhoneCard />
                </Box>
              </Box>
            </Box>
          </Box>
        </Box>
        <Box
          flex={4}
          height="100vh"
          sx={{
            borderLeft: "1px solid black",
            paddingLeft: 2,
          }}
        >
          <Box display="flex" justifyContent="center" mb={2}>
            <Typography variant="h4">Upcoming</Typography>
          </Box>
          <Box
            display="flex"
            overflow="auto"
            whiteSpace="nowrap"
            mb={2}
            gap={2}
          >
            <StatsCard number={4} text="Total number of Alarms" width={300} />
            <StatsCard
              number={10}
              text="Total number of Reminders"
              width={300}
            />
          </Box>
          <br></br>
          <br></br>
          <br></br>
          <Box display="flex" justifyContent="center" mb={2}>
            <Typography variant="h4">Alarms & Reminders</Typography>
          </Box>

          <Box>
            <List>
              {alarmsList.map((alarm) => (
                <ListItem
                  key={alarm.id}
                  sx={{
                    width: "100%",
                    mb: 1,
                    borderColor: "black",
                    borderStyle: "solid",
                    borderRadius: 2,
                  }}
                >
                  <ListItemText
                    primary={alarm.title}
                    secondary={alarm.description}
                  />
                </ListItem>
              ))}
            </List>
          </Box>
        </Box>
      </Box>
    </>
  );
};

export default Dashboard;
