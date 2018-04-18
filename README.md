# RubyCAS-Server  单点登陆服务器

## forked from: (本代码的原始官方网站）

https://github.com/rubycas/rubycas-server

## 说明

官方的代码库有问题。　不能立刻使用。　需要严格按照这个来运行：

1. ruby 版本：<= 2.2, 最好是 2.1.x
2. mysql 5.7 的版本已经兼容。修复了主键默认是null的问题。
3. 修复了一系列的activerecord, mysql2 的驱动问题
4. 避免了i18n, r18n 的问题



注意：如果遇到　说找不到gem 'activerecord-mysql2-adapter' 的话，
绝对不要傻乎乎的在Gemfile中添加下面这一行。
```
gem 'activerecord-mysql2-adapter'
```

应该做的是：　修改 mysql2　这个gem的版本。把它修改成：

```
gem 'mysql2', '~> 0.3.11'
```

而不是：

```
gem 'mysql2', '0.3.11'
```

目前来看， mysql2的　0.3.21,  0.3.18 版本都可用。  0.3.11版本则会报出奇怪的错误。

本ＣＡＳ专门在MySQL　下使用。 安装方式见下方英文：

## 中文安装:

1. 安装 ruby 2.1.2  ,在rbenv下:

$ rbenv install 2.1.2

2. 安装bundler

先退出当前terminal, 然后再重新打开一个, 进入到项目目录下(为了让刚安装的ruby 2.1.2生效)

$ gem install bundler

3. 退出当前terminal ,再重新进来, (如果rbenv 不管用的话), 然后,安装:

$ bundle


4. 修改config.yml ,修改数据库配置, 例如 数据库名称 cas_server, 就需要手动建立;

```
mysql > CREATE DATABASE IF NOT EXISTS cas_server default charset utf8 COLLATE utf8_general_ci;
```

5. 生成数据库的表结构:

$ bundle exec rake db:migrate

6. 需要实现rails devise的验证接口.

7. 启动cas server:

$ bundle exec rubycas-server -c config.yml

8. 跟nginx配合,部署到某个二级域名上,例如: cas.your-domain.com

```
  server {
          listen       80;
          server_name  cas.yoursite.name;
          charset utf-8;

          location / {
              proxy_pass          http://cas_servers;
              proxy_redirect      default;
              proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
              proxy_set_header    X-Real-IP $remote_addr;
              proxy_set_header    Host $http_host;
              proxy_next_upstream http_502 http_504 error timeout invalid_header;

          }
  }

  upstream cas_servers{
     server localhost:3300;
  }
```

9. 然后,如果你用的是 rails/devise的话,可以在对应的服务器上增加一个接口:


```
http://yoursite.com/internal_interfaces/is_password_valid?email=your@email.com&password=123456
```

```
# your controller
class InternalInterfacesController < ActionController::Base
  def is_password_valid
    if params[:email].blank?  || params[:password].blank? || !is_from_white_list_ip
      render :text => false and return
    end
    member = Member.find_by_email params[:email]
    render :text => false and return if member.blank?

    render :text =>  member.valid_password?(params[:password])
  end


  def is_from_white_list_ip
    return request.remote_ip.in? ['192.168.0.15', '127.0.0.1']
  end
end

```
