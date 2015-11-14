# sso-playground

Setup:
1. add following to /etc/hosts
```
0.0.0.0 auth.dev
0.0.0.0 blog.dev
0.0.0.0 shop.dev
```

2. clone repo and run:
```
bundle install --path vendor/bundle
```

3. start server
```
bundle ex shotgun server.rb
```

4. navigate to server
```
open http://blog.dev:9393
```

if you navigate to http://shop.dev:9393, you should now have the same token as on the blog domain.
