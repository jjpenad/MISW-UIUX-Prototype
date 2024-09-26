"use client";
import React, { useState } from "react";
import { Toolbar, Typography } from "@mui/material";

import {
  Button,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
  Box,
  Tabs,
  Tab,
} from "@mui/material";

import AddIcon from "@mui/icons-material/Add";
import DeleteIcon from "@mui/icons-material/Delete";
import DeviceIcon from "@mui/icons-material/Devices";
import MapIcon from "@mui/icons-material/Map";
import FormatListBulletedIcon from "@mui/icons-material/FormatListBulleted";

interface TabPanelProps {
  children?: React.ReactNode;
  index: number;
  value: number;
}

const alarmsList = [
  { id: 1, title: "Location 1", description: "Description for location 1" },
  { id: 2, title: "Location 2", description: "Description for location 2" },
  { id: 3, title: "Location 3", description: "Description for location 3" },
  { id: 4, title: "Location 4", description: "Description for location 4" },
  { id: 5, title: "Location 5", description: "Description for location 5" },
  { id: 6, title: "Location 6", description: "Description for location 6" },
  { id: 7, title: "Location 7", description: "Description for location 7" },
];

const remindersList = [
  { id: 1, title: "Reminder 1", description: "Description for reminder 1" },
  { id: 2, title: "Reminder 2", description: "Description for reminder 2" },
  { id: 3, title: "Reminder 3", description: "Description for reminder 3" },
  { id: 4, title: "Reminder 4", description: "Description for reminder 4" },
  { id: 5, title: "Reminder 5", description: "Description for reminder 5" },
  { id: 6, title: "Reminder 6", description: "Description for reminder 6" },
  { id: 7, title: "Reminder 7", description: "Description for reminder 7" },
];

function CustomTabPanel(props: TabPanelProps) {
  const { children, value, index, ...other } = props;

  return (
    <div
      role="tabpanel"
      hidden={value !== index}
      id={`simple-tabpanel-${index}`}
      aria-labelledby={`simple-tab-${index}`}
      {...other}
    >
      {value === index && <Box sx={{ p: 3 }}>{children}</Box>}
    </div>
  );
}

function a11yProps(index: number) {
  return {
    id: `simple-tab-${index}`,
    "aria-controls": `simple-tabpanel-${index}`,
  };
}

const Reminders: React.FC = () => {
  const [value, setValue] = useState(0);

  const handleChange = (event: React.SyntheticEvent, newValue: number) => {
    setValue(newValue);
  };

  return (
    <>
      <Toolbar />
      <Box
        display="flex"
        justifyContent="space-between"
        alignItems="center"
        mb={2}
      >
        <Typography variant="h1">Search</Typography>
        <Box>
          <Button
            variant="contained"
            color="primary"
            startIcon={<AddIcon />}
            sx={{ mr: 1 }}
          >
            Add
          </Button>
          <Button
            variant="contained"
            color="secondary"
            startIcon={<DeleteIcon />}
          >
            Delete
          </Button>
        </Box>
      </Box>
      <Box>
        <Button variant="text" color="primary" sx={{ mr: 1 }}>
          Filters
        </Button>
      </Box>

      <Box sx={{ width: "100%" }}>
        <Box sx={{ borderBottom: 1, borderColor: "divider" }}>
          <Tabs
            value={value}
            onChange={handleChange}
            aria-label="basic tabs example"
          >
            <Tab
              label={
                <span style={{ display: "flex", alignItems: "center" }}>
                  <MapIcon />
                  <span style={{ marginLeft: 8 }}>Alarms</span>
                </span>
              }
              {...a11yProps(0)}
            />
            <Tab
              label={
                <span style={{ display: "flex", alignItems: "center" }}>
                  <FormatListBulletedIcon />
                  <span style={{ marginLeft: 8 }}>Reminders</span>
                </span>
              }
              {...a11yProps(1)}
            />
          </Tabs>
        </Box>
        <CustomTabPanel value={value} index={0}>
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
                <ListItemIcon>
                  <DeviceIcon />
                </ListItemIcon>
                <ListItemText
                  primary={alarm.title}
                  secondary={alarm.description}
                />
              </ListItem>
            ))}
          </List>
        </CustomTabPanel>
        <CustomTabPanel value={value} index={1}>
          <List>
            {remindersList.map((reminder) => (
              <ListItem
                key={reminder.id}
                sx={{
                  width: "100%",
                  mb: 1,
                  borderColor: "black",
                  borderStyle: "solid",
                  borderRadius: 2,
                }}
              >
                <ListItemIcon>
                  <DeviceIcon />
                </ListItemIcon>
                <ListItemText
                  primary={reminder.title}
                  secondary={reminder.description}
                />
              </ListItem>
            ))}
          </List>
        </CustomTabPanel>
      </Box>
    </>
  );
};

export default Reminders;
