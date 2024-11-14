FROM debian:bookworm
WORKDIR /opt/alist

# 安装必要的依赖
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://pkg.cloudflare.com/cloudflare-main.gpg --output /usr/share/keyrings/cloudflare-main.gpg && \
    echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared bullseye main' | tee /etc/apt/sources.list.d/cloudflared.list && \
    apt update && \
    apt install --yes --no-install-recommends -t stable cloudflared && \
    cloudflared version && \
    rm -rf /var/lib/apt/lists/* && \
    apt --yes autoremove
CMD  cloudflared service install eyJhIjoiZDgxNzY5YTBmZTUxOTQ1NWRlNmQ1YjcwODhlYjBjZGMiLCJ0IjoiYjQ1YmE4ZTAtNjU1Ny00ZWUxLWI1YmYtZDZhMjcxN2VmYTQ4IiwicyI6IlpXRmhORFF6TURBdE1HRTJaQzAwT0dVNExUazVOamt0WTJNd01EUTROak0zTmpWbSJ9
