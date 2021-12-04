# VVDD (vagrant + virtualbox + docker + development)

author：william

## 一、准备
```
1、安装virtualbox ,官网https://www.virtualbox.org/
2、安装vagrant ,官网https://www.vagrantup.com/
    安装vagrant插件：
    vagrant plugin install vagrant-vbguest
    vagrant plugininstallvagrant-winnfsd（windows系统需要安装这个）
3、git clone https://github.com/asialong/vvdd.git
    cd www
    cp docker-compose-sample.yml docker-compose.yml
    cp env.sample .env
```

## 二、启动并进入
```
1、vagrant up
2、vagrant ssh 虚拟机名（多机时使用）
```
## 三、按需安装容器
### 使用composer
**我们建议在主机HOST中使用composer，避免PHP容器变得庞大**。
1. 在主机创建一个目录，用以保存composer的配置和缓存文件：
    ```
    mkdir ~/composer
    ```
2. 打开主机的 `~/.bashrc` 或者 `~/.zshrc` 文件，加上：
    ```
    composer () {
        tty=
        tty -s && tty=--tty
        docker run \
            $tty \
            --interactive \
            --rm \
            --user $(id -u):$(id -g) \
            --volume ~/composer:/tmp \
            --volume /etc/passwd:/etc/passwd:ro \
            --volume /etc/group:/etc/group:ro \
            --volume $(pwd):/app \
            composer "$@"
    }

    ```
3. 让文件起效：
    ```
    source ~/.bashrc
    ```
4. 开启容器
    ```
    cd /www
    cp docker-compose-sample.yml docker-compose.yml
    cp env.sample .env
    docker-compose up -d
    ```
5. （可选）如果提示需要依赖，用`--ignore-platform-reqs --no-scripts`关闭依赖检测。
6. （可选）第一次使用 composer 会在 ~/composer 目录下生成一个config.json文件，可以在这个文件中指定国内仓库，例如：
    ```
    {
        "config": {},
        "repositories": {
            "packagist": {
                "type": "composer",
                "url": "https://mirrors.aliyun.com/composer/"
            }
        }
    }

    ```
	或者
	```
	composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
	```
7. 如果navicat工具连不上mysql,进入mysql容器：
	```
	use mysql;
	select user,host,plugin from user;
	ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
	update user set host='%' where user='root';
	GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
	select user,host,plugin from user;
	flush privileges;
    ```
