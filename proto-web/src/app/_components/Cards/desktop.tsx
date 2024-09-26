import React from "react";
import { Card, CardContent } from "@mui/material";
import Image from "next/image";

const DesktopCard: React.FC = () => {
  return (
    <Card
      sx={{
        borderRadius: 2,
        width: 400,
        height: 230,
        backgroundColor: "#00D0C2",
      }}
    >
      <CardContent>
        <Image src="/desktop.png" alt="Phone" width={370} height={200} />
      </CardContent>
    </Card>
  );
};

export default DesktopCard;
