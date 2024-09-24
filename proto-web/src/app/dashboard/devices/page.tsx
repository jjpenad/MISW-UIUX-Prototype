"use client";
import React from "react";
import { Toolbar, Typography } from "@mui/material";

import {
  Button,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
  Box,
} from "@mui/material";
import AddIcon from "@mui/icons-material/Add";
import DeleteIcon from "@mui/icons-material/Delete";
import DeviceIcon from "@mui/icons-material/Devices";

const deviceList = [
  { id: 1, title: "Device 1", description: "Description for device 1" },
  { id: 2, title: "Device 2", description: "Description for device 2" },
  { id: 3, title: "Device 3", description: "Description for device 3" },
];

const Devices: React.FC = () => {
  return (
    <>
      <Toolbar />
      <Box
        display="flex"
        justifyContent="space-between"
        alignItems="center"
        mb={2}
      >
        <Typography variant="h1">Devices</Typography>
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
      <List>
        {deviceList.map((device) => (
          <ListItem
            key={device.id}
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
              primary={device.title}
              secondary={device.description}
            />
          </ListItem>
        ))}
      </List>
    </>
  );
};

export default Devices;
