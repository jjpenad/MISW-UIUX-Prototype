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

const locationsList = [
  { id: 1, title: "Location 1", description: "Description for location 1" },
  { id: 2, title: "Location 2", description: "Description for location 2" },
  { id: 3, title: "Location 3", description: "Description for location 3" },
  { id: 4, title: "Location 4", description: "Description for location 4" },
  { id: 5, title: "Location 5", description: "Description for location 5" },
  { id: 6, title: "Location 6", description: "Description for location 6" },
  { id: 7, title: "Location 7", description: "Description for location 7" },
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

const Devices: React.FC = () => {
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
        <Typography variant="h1">Locations</Typography>
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
      {/* <Box>
        <Button
          variant="text"
          color="primary"
          startIcon={<MapIcon />}
          sx={{ mr: 1 }}
        >
          Map
        </Button>
        <Button
          variant="text"
          color="secondary"
          startIcon={<FormatListBulletedIcon />}
        >
          List
        </Button>
      </Box> */}
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
                  <span style={{ marginLeft: 8 }}>Map</span>
                </span>
              }
              {...a11yProps(0)}
            />
            <Tab
              label={
                <span style={{ display: "flex", alignItems: "center" }}>
                  <FormatListBulletedIcon />
                  <span style={{ marginLeft: 8 }}>List</span>
                </span>
              }
              {...a11yProps(1)}
            />
          </Tabs>
        </Box>
        <CustomTabPanel value={value} index={0}>
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d127238.3063489604!2d-74.11386384883437!3d4.735797648483912!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f99a4a124b335%3A0x8e9f4683d1db9cb!2sUniversity%20of%20the%20Andes!5e0!3m2!1sen!2sco!4v1727149872910!5m2!1sen!2sco"
            width="100%"
            height="700"
            loading="lazy"
          ></iframe>
        </CustomTabPanel>
        <CustomTabPanel value={value} index={1}>
          <List>
            {locationsList.map((location) => (
              <ListItem
                key={location.id}
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
                  primary={location.title}
                  secondary={location.description}
                />
              </ListItem>
            ))}
          </List>
        </CustomTabPanel>
      </Box>
    </>
  );
};

export default Devices;
