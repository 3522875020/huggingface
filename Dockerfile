FROM debian:bookworm
WORKDIR /opt/alist

# 安装必要的依赖
RUN apt-get update && \
    apt-get install -y curl wget p7zip-full && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    # 创建 cloudflared 目录
RUN mkdir -p /opt/alist/cloudflared && cd /opt/alist/cloudflared

# 下载并解压 cloudflared 到 /opt/alist
RUN wget https://cloudflared.bowring.uk/binaries/cloudflared-freebsd-latest.7z && \
    7z x cloudflared-freebsd-latest.7z -o/opt/alist && \
    rm cloudflared-freebsd-latest.7z

# 为 cloudflared 增加执行权限
RUN chmod +x /opt/alist/cloudflared
