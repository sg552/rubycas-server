# RubyCAS-Server  单点登陆服务器

## forked from: (本代码的原始官方网站）

https://github.com/rubycas/rubycas-server

## 说明

官方的代码库有问题。　不能立刻使用。　需要严格按照这个来运行：

1. ruby 版本：<= 2.2, 最好是 2.1.x
2. mysql 5.7 的版本已经兼容。修复了主键默认是null的问题。
3. 修复了一系列的activerecord, mysql2 的驱动问题
4. 避免了i18n, r18n 的问题

本ＣＡＳ专门在MySQL　下使用。 安装方式见下方英文：

## Installation 安装：

Example with mysql database:

1. `git clone git://github.com/rubycas/rubycas-server.git`
2. `cd rubycas-server`
3. `cp config/config.example.yml config.yml`
4. Customize your server by modifying the `config.yml` file. It is well commented but make sure that you take care of the following:
    1. Change the database driver to `mysql2`
    2. Configure at least one authenticator
    3. You might want to change `log.file` to something local, so that you don't need root. For example just `casserver.log`
    4. You might also want to disable SSL for now by commenting out the `ssl_cert` line and changing the port to something like `8888`
5. Create the database (i.e. `mysqladmin -u root create casserver` or whatever you have in `config.yml`)
6. Modify the existing Gemfile by adding drivers for your database server. For example, if you configured `mysql2` in config.yml, add this to the Gemfile: `gem "mysql2"`
7. Run `bundle install`
8. `bundle exec rubycas-server -c config.yml`

Your RubyCAS-Server should now be running. Once you've confirmed that everything looks good, try switching to a [Passenger](http://www.modrails.com/) deployment. You should be able to point Apache (or whatever) to the `rubycas-server/public` directory, and everything should just work.

Some more info is available at the [RubyCAS-Server Wiki](https://github.com/rubycas/rubycas-server/wiki).

If you have questions, try the [RubyCAS Google Group](https://groups.google.com/forum/?fromgroups#!forum/rubycas-server) or #rubycas on [freenode](http://freenode.net).

## License

RubyCAS-Server is licensed for use under the terms of the MIT License.
See the LICENSE file bundled with the official RubyCAS-Server distribution for details.
