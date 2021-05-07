FROM node:14.16.1
LABEL author=weiixu 
ENV NODE_ENV=production
ENV HOST 0.0.0.0
RUN mkdir -p /app_weiixu
COPY . /app_weiixu
WORKDIR /app_weiixu
EXPOSE 3000
#If the environment in China build please open the following comments
#如果在中国环境下构建请把下面注释打开
RUN npm config set registry https://registry.npm.taobao.org
RUN npm install
# 服务端渲染，编译时需开启服务
RUN npm run build 
# 静态部署，生成dist文件夹
# RUN npm run generate
CMD ["npm", "start"]

# build image
# docker build -t nuxt-weiixu .

# serve at localhost:8030
# docker run -dt -p 8030:3000 nuxt-weiixu