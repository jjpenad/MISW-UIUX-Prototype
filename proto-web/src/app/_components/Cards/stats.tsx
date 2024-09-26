import React from "react";
import { Card, CardContent, Typography, Box } from "@mui/material";

interface StatsCardProps {
  number: number;
  width: number;
  text: string;
}

const StatsCard: React.FC<StatsCardProps> = ({ number, text, width }) => {
  return (
    <Card
      sx={{
        borderRadius: 2,
        paddingY: 4,
        width: width,
        backgroundColor: "#163C86",
      }}
    >
      <CardContent>
        <Box display="flex" alignItems="center" justifyContent="space-evenly">
          <Typography variant="h4" color="white">
            {number}
          </Typography>
          <Box display="flex" flexDirection="column" alignItems="center">
            <Typography variant="h6" color="white" align="center">
              {text.split(" ").map((word, index) => (
                <React.Fragment key={index}>
                  {word}
                  {index < text.split(" ").length - 1 && " "}
                </React.Fragment>
              ))}
            </Typography>
          </Box>
        </Box>
      </CardContent>
    </Card>
  );
};

export default StatsCard;
