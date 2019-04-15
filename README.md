# WXQOpenSourceLibrary
#### 制作一个带版本的CocoaPods开源三方库并托管到GitHub

日常开发的时候，我们会用`CocoaPods`集成一些第三方库在项目中使用。但我们也希望能够将自己的代码制作成`Pod`库供别人使用。下面我们就来制作一个属于自己的`Pod`开源库，并发布到`CocoaPods`供他人使用。
#### 1、新建项目
首先在`Github`上新建一个项目， 新建的时候要勾选许可类型：`MIT License`。
![新建项目](https://upload-images.jianshu.io/upload_images/4037795-cdf2eb39ab8f3e36.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
#### 2、将新创建的项目克隆到本地
```
git clone https://github.com/wuyukobe24/WXQOpenSourceLibrary.git
```
打开项目，会有一个`LICENSE`文件。
#### 3、添加开源代码
往克隆到本地的文件夹中添加要开源的代码：
![开源代码](https://upload-images.jianshu.io/upload_images/4037795-5fa652b2c9c1d999.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
`WXQOpenSourceLibrary`文件夹内为要开源的代码。
#### 4、创建podspec文件
###### 备注：podspec 文件是 Pod 库的描述文件，每个 Pod 库必须有且仅有一个这样的文件。文件名需要与我们创建的 Pod 库的名称一致。
打开终端, 进入到项目的根目录:
```
cd /Users/wangxueqi/Desktop/WXQOpenSourceLibrary
```
然后执行下面的指令新建`Podspec`文件(创建的`Podspec`文件名称要和项目名称保持一致)：
```
pod spec create WXQOpenSourceLibrary
```
![成功创建Podspec文件](https://upload-images.jianshu.io/upload_images/4037795-a7c9425df2031f34.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

此时, 本地文件夹下就多了一个文件: `WXQOpenSourceLibrary.podspec`。
然后对`WXQOpenSourceLibrary.podspec`双击右键->打开方式->文本编辑，打开这个文件(或者使用其他的方式打开, 例如：`Xcode`，` VSCode`等)，然后修改其中的内容为以下：
```
Pod::Spec.new do |s|
  #库名
  s.name         = "WXQOpenSourceLibrary"
  #库版本
  s.version      = "0.0.1"
  #库简短描述
  s.summary      = "creat a OpenSourceLibrary"
  #库详细描述(要比上面的简短描述长)
  s.description  = <<-DESC
      It introduces how to creat a OpenSourceLibrary
                   DESC

  #库介绍主页地址
  s.homepage     = "https://github.com/wuyukobe24/WXQOpenSourceLibrary"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  #库开源许可
  s.license      = { :type => "MIT", :file => "LICENSE" }
  #作者信息
  s.author             = { 'wuyukobe24' => 'jkwxq@sina.com' }
  # Or just: s.author    = "wuyukobe24"
  # s.authors            = { "wuyukobe24" => "jkwxq@sina.com" }

  # s.platform     = :ios
  # s.platform     = :ios, "5.0"
  #库依赖系统版本
  # s.ios.deployment_target = "8.0"
  #源码git地址
  s.source       = { :git => "https://github.com/wuyukobe24/WXQOpenSourceLibrary.git", :tag => "#{s.version}" }
  #源码文件配置
  s.source_files  = 'WXQOpenSourceLibrary/Classes/*.{h,m}'
  s.exclude_files = "Classes/Exclude"
  #源码头文件配置
  # s.public_header_files = "WXQOpenSourceLibrary/Classes/*."
  #资源文件配置
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
  #系统框架依赖
  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
  #是否支持arc
  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
```

完成后，执行下面的指令来验证这个文件是否可用:
```
pod lib lint WXQOpenSourceLibrary.podspec
```
如果有错误，根据错误提示，进行修改；如果仅仅是警告，不想修改的话，可以使用下面的指令来忽略：
```
pod lib lint WXQOpenSourceLibrary.podspec —allow-warnings
```
最后，输出下面这个，即是验证通过：

![podspec验证通过](https://upload-images.jianshu.io/upload_images/4037795-8efa755c4d10e83d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 5、将代码推送到Github:
终端依次输入命令如下：
```
cd /Users/wangxueqi/Desktop/WXQOpenSourceLibrary 
git add .
git commit -m "添加开源源码和podspec"
git pull
git push origin master
```
完整输出命令行如下：
```
localhost:WXQOpenSourceLibrary wangxueqi$ cd /Users/wangxueqi/Desktop/WXQOpenSourceLibrary 
localhost:WXQOpenSourceLibrary wangxueqi$ ls
LICENSE				WXQOpenSourceLibrary.podspec
WXQOpenSourceLibrary
localhost:WXQOpenSourceLibrary wangxueqi$ git add .
localhost:WXQOpenSourceLibrary wangxueqi$ git commit -m "添加开源源码和podspec"
[master 9ab8d16] 添加开源源码和podspec
 10 files changed, 555 insertions(+)
 create mode 100644 WXQOpenSourceLibrary.podspec
 create mode 100644 WXQOpenSourceLibrary/Classes/WXQCustomLabelFlow.h
 create mode 100644 WXQOpenSourceLibrary/Classes/WXQCustomLabelFlow.m
 create mode 100644 WXQOpenSourceLibrary/Classes/WXQCustomLabelFlowCell.h
 create mode 100644 WXQOpenSourceLibrary/Classes/WXQCustomLabelFlowCell.m
 create mode 100644 WXQOpenSourceLibrary/Classes/WXQCustomLabelFlowConfig.h
 create mode 100644 WXQOpenSourceLibrary/Classes/WXQCustomLabelFlowConfig.m
 create mode 100644 WXQOpenSourceLibrary/Classes/WXQCustomLabelFlowLayout.h
 create mode 100644 WXQOpenSourceLibrary/Classes/WXQCustomLabelFlowLayout.m
 create mode 100644 WXQOpenSourceLibrary/Classes/WXQLabelFlow.h
localhost:WXQOpenSourceLibrary wangxueqi$ git pull
Already up to date.
localhost:WXQOpenSourceLibrary wangxueqi$ git push origin master
Counting objects: 14, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (13/13), done.
Writing objects: 100% (14/14), 7.29 KiB | 3.65 MiB/s, done.
Total 14 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), done.
To https://github.com/wuyukobe24/WXQOpenSourceLibrary.git
   57215f4..9ab8d16  master -> master
```
推送成功后，刷新`Github`仓库之后如下：

![上传源码展示](https://upload-images.jianshu.io/upload_images/4037795-4936e65e0035f0fc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 6、新建版本
来到`Github`上，创建`release`版本，选择`release`:

![选择release](https://upload-images.jianshu.io/upload_images/4037795-6bc43084a85ade0a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

点击`release`之后，如果是个新的项目的话，里面没有任何版本信息的，需要点击`create a new release`：

![新建版本提示](https://upload-images.jianshu.io/upload_images/4037795-acbe96a609fd3a7f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

注意: 这里的`Tag verson` 一定要和上面设置的`s.version`以及`s.source`中的`tag`保持一致。信息填写如下：

![信息填写](https://upload-images.jianshu.io/upload_images/4037795-94c1b2d2e0d64987.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

填好之后，点击下面的`Public release`即可完成!

![完成版本创建](https://upload-images.jianshu.io/upload_images/4037795-20f66c56de6e5dd6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 7、注册CocoaPods账户
接下来输入以下指令，来链接到你的`CocoaPods`账户：
```
// 邮箱  用户名   描述信息
pod trunk register jkwxq@sina.com 'WXQOpenSourceLibrary'
```
正确的话会出现下图：

![CocoaPods账户验证](https://upload-images.jianshu.io/upload_images/4037795-60f031d7d77232e0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

根据提示，到你的邮箱里去确认邮件即可。邮件内容为：
```
Hi wuyukobe24,
Please confirm your CocoaPods session by clicking the following link:
https://trunk.cocoapods.org/sessions/verify/9b021c15
If you did not request this you do not need to take any further action.
Kind regards, the CocoaPods team
```
打开其中链接`https://trunk.cocoapods.org/sessions/verify/9b021c15`出现下图即为验证成功。

![邮件验证成功](https://upload-images.jianshu.io/upload_images/4037795-26297261dae5c201.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

确认之后，可以使用下面的指令来确认账号是否可用：
```
pod trunk me
```
如果可用，会输出相关的信息：

![CocoaPods账户验证成功](https://upload-images.jianshu.io/upload_images/4037795-5728950243a9e306.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 8、上传代码到Cocoapods
以上全部完成后，最后一步就是上传代码到`Cocoapods`了。
首先，使用下面的指令来检查文件是否可用：
```
pod spec lint
```
远程验证成功，会输出：

![远程验证成功](https://upload-images.jianshu.io/upload_images/4037795-a3f11a81c54a5b34.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

最后就是上传代码了，使用下面的指令进行上传：
```
pod trunk push WXQOpenSourceLibrary.podspec
```
上传的时间可能会有点长，耐心等待，成功后会输出：

![上传成功](https://upload-images.jianshu.io/upload_images/4037795-3c70c179c6847b3d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###### 注意：如果这里因为有警告而导致失败，可以在后面添加`--allow-warnings`来忽略警告，即：
```
pod trunk push WXQOpenSourceLibrary.podspec --allow-warnings
```
至此，制作带版本号的开源三方库并托管到`GitHub`的流程就完成了。

我们可以搜索刚制作的三方库`WXQOpenSourceLibrary`：
```
pod search WXQOpenSourceLibrary
```
结果会搜不到：
```
[!] Unable to find a pod with name, author, summary, or description matching `WXQOpenSourceLibrary`
```
当搜索不到这个库，或者在使用时找不到这个库，可以使用下面的指令来清理一下缓存：
```
rm ~/Library/Caches/CocoaPods/search_index.json
```
然后重新搜索，耐心等待，就会出现：

![搜索成功](https://upload-images.jianshu.io/upload_images/4037795-449e579d0d7dbc32.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

最后我们可以创建一个项目，添加`CocoaPods`，引入开源库`pod 'WXQOpenSourceLibrary', '~> 0.0.1'`测试我们刚创建的开源库，
`pod install`之后没问题会出现：

![CocoaPods成功导入WXQOpenSourceLibrary库](https://upload-images.jianshu.io/upload_images/4037795-155db9a800494c72.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

然后我们就可以愉快的在项目中使用我们的开源库了〜

#### 9、更新代码以及开源库的版本
如果我们需要更新自己的类库，只需要将最新的代码提交到`Github`，然后创建新的`release`版本（注意：这里的版本要和`podspec`文件内的`s.version`一致）。
##### 步骤：
 首先创建新的`release`版本（上面步骤6），如`0.0.2`。然后cd到当前文件夹（`WXQOpenSourceLibrary.podspec`平级的文件夹），执行以下命令即可：
```
 cd /Users/wangxueqi/Desktop/WXQOpenSourceLibrary
 git add .                      //新增的文件 加入仓库 
 git commit -a -m "0.0.2"       //需要提交的文件上传确认
 git pull origin master         //下拉最新资源
 git push origin master         //上传本地最新代码
 git tag 0.0.2                  //打tag,设置版本号
 git push --tags                //推送新版本号
 pod spec lint --allow-warnings //验证远程服务器的库是否正确 spec换成 lib的话就是验证本地库是否正确
 pod trunk push WXQOpenSourceLibrary.podspec //上传代码
```

##### 以上。

##### 简书文章地址：[制作一个带版本的CocoaPods开源三方库并托管到GitHub](https://www.jianshu.com/p/d80c53e88490)
