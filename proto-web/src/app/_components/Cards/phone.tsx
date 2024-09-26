import React from "react";
import { Card, CardContent } from "@mui/material";
import Image from "next/image";

const PhoneCard: React.FC = () => {
  return (
    <Card
      sx={{
        borderRadius: 2,
        width: 180,
        height: 280,
        backgroundColor: "#AAC2F1",
      }}
    >
      <CardContent>
        <Image src="/phone.png" alt="Phone" width={150} height={250} />
      </CardContent>
    </Card>
  );
};

export default PhoneCard;
