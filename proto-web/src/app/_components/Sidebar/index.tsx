"use client";
import React, { useState } from "react";
import { useRouter } from "next/navigation";
import {
  Drawer,
  List,
  ListItemButton,
  ListItemIcon,
  ListItemText,
} from "@mui/material";
import { styled } from "@mui/system";
import Image from "next/image";
import HomeIcon from "@mui/icons-material/Home";
import LocationOnIcon from "@mui/icons-material/LocationOn";
import DevicesIcon from "@mui/icons-material/Devices";
import AlarmIcon from "@mui/icons-material/Alarm";
import SettingsIcon from "@mui/icons-material/Settings";

const DrawerStyled = styled(Drawer)(({}) => ({
  width: 240,
  backgroundColor: "#262633",
  height: "100vh",
  flexShrink: 0,
  "& .MuiDrawer-paper": {
    width: 240,
    display: "flex",
    flexDirection: "column",
    justifyContent: "space-between",
  },
}));

const Logo = styled("div")(({ theme }) => ({
  position: "relative",
  padding: theme.spacing(1),
  textAlign: "center",
  backgroundColor: "#262633",
  height: 100,
}));

const NavList = styled(List)(({}) => ({
  flexGrow: 1,
  backgroundColor: "#262633",
  height: "100vh",
}));

const ListItemTextStyled = styled(ListItemText)(({}) => ({
  color: "#FFFFFF",
}));

const CenteredList = styled(List)(({}) => ({
  display: "flex",
  flexDirection: "column",
  justifyContent: "center",
}));

const ListItemIconStyled = styled(ListItemIcon)(({}) => ({
  color: "#FFFFFF",
}));

const Sidebar: React.FC = () => {
  const router = useRouter();
  const [selectedIndex, setSelectedIndex] = useState<number>(0);

  const handleListItemClick = (index: number, path: string) => {
    setSelectedIndex(index);
    router.push(path);
  };

  return (
    <DrawerStyled variant="permanent">
      <Logo>
        <Image src="/logo.png" alt="Logo" fill />
      </Logo>

      <NavList>
        <CenteredList>
          <ListItemButton
            selected={selectedIndex === 0}
            onClick={() => handleListItemClick(0, "/dashboard")}
          >
            <ListItemIconStyled>
              <HomeIcon />
            </ListItemIconStyled>
            <ListItemTextStyled primary="Home" />
          </ListItemButton>
          <ListItemButton
            selected={selectedIndex === 1}
            onClick={() => handleListItemClick(1, "/dashboard/locations")}
          >
            <ListItemIconStyled>
              <LocationOnIcon />
            </ListItemIconStyled>
            <ListItemTextStyled primary="Locations" />
          </ListItemButton>
          <ListItemButton
            selected={selectedIndex === 2}
            onClick={() => handleListItemClick(2, "/dashboard/devices")}
          >
            <ListItemIconStyled>
              <DevicesIcon />
            </ListItemIconStyled>
            <ListItemTextStyled primary="Devices" />
          </ListItemButton>
          <ListItemButton
            selected={selectedIndex === 3}
            onClick={() => handleListItemClick(3, "/dashboard/search")}
          >
            <ListItemIconStyled>
              <AlarmIcon />
            </ListItemIconStyled>
            <ListItemTextStyled primary="Alarms and Reminders" />
          </ListItemButton>
          <ListItemButton
            selected={selectedIndex === 4}
            onClick={() => handleListItemClick(4, "/dashboard/configuration")}
          >
            <ListItemIconStyled>
              <SettingsIcon />
            </ListItemIconStyled>
            <ListItemTextStyled primary="Configuration" />
          </ListItemButton>
        </CenteredList>
      </NavList>
    </DrawerStyled>
  );
};

export default Sidebar;
