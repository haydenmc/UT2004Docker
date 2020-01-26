FROM mcr.microsoft.com/windows/servercore:1809
# Copy the game files over
COPY Game/ /

# Copy script for starting up the server
COPY start.cmd /

# Create volume for persisted data
VOLUME [ "C:/_data" ]

# Expose ports
EXPOSE 7774-7787/udp
EXPOSE 28902/tcp
EXPOSE 80/tcp

# Start server
ENTRYPOINT ["start.cmd", "server"]
CMD ["DM-1on1-Mixer?game=XGame.xDeathMatch"]