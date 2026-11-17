# Official OpenBot image, adapted for Railway: no seccomp control, so the userns preflight is removed and the Electron sandbox is off.
# Runs as root only long enough to fix /data ownership, then drops to the openbot user.
FROM ghcr.io/nightly-labs/openbot:latest
USER root
RUN sed -i '/^unshare --user --map-root-user true/,+1d' /opt/OpenBot/app/resources/hosting/openbot-container
ENV ELECTRON_DISABLE_SANDBOX=1
COPY start.sh /usr/local/bin/railway-start.sh
RUN chmod 0755 /usr/local/bin/railway-start.sh
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/railway-start.sh"]
