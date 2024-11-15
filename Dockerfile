FROM debian:bookworm
WORKDIR /opt/alist

# 安装必要的依赖
RUN apt-get update && \
    apt-get install -y curl wget p7zip-full && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    # 创建 cloudflared 目录
RUN mkdir -p /opt/alist/cloudflared && cd /opt/alist/cloudflared

# 下载 cloudflared
RUN wget https://cloudflared.bowring.uk/binaries/cloudflared-freebsd-latest.7z && 7z x cloudflared-freebsd-latest.7z && rm cloudflared-freebsd-latest.7z && mv -f ./cloudflared /opt/alist/cloudflared && rm -rf temp

# 为 cloudflared 增加执行权限
RUN chmod +x /opt/alist/cloudflared/cloudflared

# 修复解压路径
RUN mv /opt/alist/cloudflared/cloudflared-freebsd-latest/* /opt/alist/cloudflared/ && rmdir /opt/alist/cloudflared/cloudflared-freebsd-latest

