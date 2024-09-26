"use client";
import React from "react";
import { CssBaseline, Box } from "@mui/material";
import { styled } from "@mui/system";
import Sidebar from "@/app/_components/Sidebar";

const drawerWidth = 100;

const Main = styled("main")(({ theme }) => ({
  flexGrow: 1,
  padding: theme.spacing(1),
  marginLeft: drawerWidth,
}));

interface DashboardProps {
  children: React.ReactNode;
}

const Dashboard: React.FC<DashboardProps> = ({ children }: DashboardProps) => {
  return (
    <Box sx={{ display: "flex" }}>
      <CssBaseline />
      <Sidebar />
      <Main>{children}</Main>
    </Box>
  );
};

export default Dashboard;
