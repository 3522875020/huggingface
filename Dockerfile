FROM debian:bookworm
WORKDIR /opt/alist

# 安装必要的依赖
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 安装cloudflared
RUN curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
    dpkg -i cloudflared.deb && \
    cloudflared service install eyJhIjoiZDgxNzY5YTBmZTUxOTQ1NWRlNmQ1YjcwODhlYjBjZGMiLCJ0IjoiYjQ1YmE4ZTAtNjU1Ny00ZWUxLWI1YmYtZDZhMjcxN2VmYTQ4IiwicyI6IlpXRmhORFF6TURBdE1HRTJaQzAwT0dVNExUazVOamt0WTJNd01EUTROak0zTmpWbSJ9

# 启动cloudflared服务
ENTRYPOINT ["cloudflared"]
CMD ["tunnel", "run", "eyJhIjoiZDgxNzY5YTBmZTUxOTQ1NWRlNmQ1YjcwODhlYjBjZGMiLCJ0IjoiYjQ1YmE4ZTAtNjU1Ny00ZWUxLWI1YmYtZDZhMjcxN2VmYTQ4IiwicyI6IlpXRmhORFF6TURBdE1HRTJaQzAwT0dVNExUazVOamt0WTJNd01EUTROak0zTmpWbSJ9"，"--url", "localhost:5244"]
