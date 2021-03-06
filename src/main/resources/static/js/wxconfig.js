/*
 * 注意：
 * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
 * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
 * 3. 完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
 *
 * 如有问题请通过以下渠道反馈：
 * 邮箱地址：weixin-open@qq.com
 * 邮件主题：【微信JS-SDK反馈】具体问题
 * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
 */
wx.ready(function () {
    // 1 判断当前版本是否支持指定 JS 接口，支持批量判断
    wx.checkJsApi({
        jsApiList: [
            'getNetworkType',
            'previewImage'
        ],
        success: function (res) {
            alert(JSON.stringify(res));
        }
    });

    // 2. 分享接口
    // 2.1 监听“分享给朋友”，按钮点击、自定义分享内容及分享结果接口
    wx.onMenuShareAppMessage({
        title: '互联网之子',
        desc: '在长大的过程中，我才慢慢发现，我身边的所有事，别人跟我说的所有事，那些所谓本来如此，注定如此的事，它们其实没有非得如此，事情是可以改变的。更重要的是，有些事既然错了，那就该做出改变。',
        link: 'http://movie.douban.com/subject/25785114/',
        imgUrl: 'http://demo.open.weixin.qq.com/jssdk/images/p2166127561.jpg',
        trigger: function (res) {
            // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
            alert('用户点击发送给朋友');
        },
        success: function (res) {
            alert('已分享');
        },
        cancel: function (res) {
            alert('已取消');
        },
        fail: function (res) {
            alert(JSON.stringify(res));
        }
    });
    alert('已注册获取“发送给朋友”状态事件');

    // 2.2 监听“分享到朋友圈”按钮点击、自定义分享内容及分享结果接口
    wx.onMenuShareTimeline({
        title: '互联网之子',
        link: 'http://movie.douban.com/subject/25785114/',
        imgUrl: 'http://demo.open.weixin.qq.com/jssdk/images/p2166127561.jpg',
        trigger: function (res) {
            // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
            alert('用户点击分享到朋友圈');
        },
        success: function (res) {
            alert('已分享');
        },
        cancel: function (res) {
            alert('已取消');
        },
        fail: function (res) {
            alert(JSON.stringify(res));
        }
    });
    alert('已注册获取“分享到朋友圈”状态事件');

    // 2.3 监听“分享到QQ”按钮点击、自定义分享内容及分享结果接口
    wx.onMenuShareQQ({
        title: '互联网之子',
        desc: '在长大的过程中，我才慢慢发现，我身边的所有事，别人跟我说的所有事，那些所谓本来如此，注定如此的事，它们其实没有非得如此，事情是可以改变的。更重要的是，有些事既然错了，那就该做出改变。',
        link: 'http://movie.douban.com/subject/25785114/',
        imgUrl: 'http://img3.douban.com/view/movie_poster_cover/spst/public/p2166127561.jpg',
        trigger: function (res) {
            alert('用户点击分享到QQ');
        },
        complete: function (res) {
            alert(JSON.stringify(res));
        },
        success: function (res) {
            alert('已分享');
        },
        cancel: function (res) {
            alert('已取消');
        },
        fail: function (res) {
            alert(JSON.stringify(res));
        }
    });
    alert('已注册获取“分享到 QQ”状态事件');

    // 2.4 监听“分享到微博”按钮点击、自定义分享内容及分享结果接口
    wx.onMenuShareWeibo({
        title: '互联网之子',
        desc: '在长大的过程中，我才慢慢发现，我身边的所有事，别人跟我说的所有事，那些所谓本来如此，注定如此的事，它们其实没有非得如此，事情是可以改变的。更重要的是，有些事既然错了，那就该做出改变。',
        link: 'http://movie.douban.com/subject/25785114/',
        imgUrl: 'http://img3.douban.com/view/movie_poster_cover/spst/public/p2166127561.jpg',
        trigger: function (res) {
            alert('用户点击分享到微博');
        },
        complete: function (res) {
            alert(JSON.stringify(res));
        },
        success: function (res) {
            alert('已分享');
        },
        cancel: function (res) {
            alert('已取消');
        },
        fail: function (res) {
            alert(JSON.stringify(res));
        }
    });
    alert('已注册获取“分享到微博”状态事件');

    // 2.5 监听“分享到QZone”按钮点击、自定义分享内容及分享接口
    wx.onMenuShareQZone({
        title: '互联网之子',
        desc: '在长大的过程中，我才慢慢发现，我身边的所有事，别人跟我说的所有事，那些所谓本来如此，注定如此的事，它们其实没有非得如此，事情是可以改变的。更重要的是，有些事既然错了，那就该做出改变。',
        link: 'http://movie.douban.com/subject/25785114/',
        imgUrl: 'http://img3.douban.com/view/movie_poster_cover/spst/public/p2166127561.jpg',
        trigger: function (res) {
            alert('用户点击分享到QZone');
        },
        complete: function (res) {
            alert(JSON.stringify(res));
        },
        success: function (res) {
            alert('已分享');
        },
        cancel: function (res) {
            alert('已取消');
        },
        fail: function (res) {
            alert(JSON.stringify(res));
        }
    });
    alert('已注册获取“分享到QZone”状态事件');


    // 3 智能接口
    var voice = {
        localId: '',
        serverId: ''
    };
    // 3.1 识别音频并返回识别结果
    wx.translateVoice({
        localId: voice.localId,
        complete: function (res) {
            if (res.hasOwnProperty('translateResult')) {
                alert('识别结果：' + res.translateResult);
            } else {
                alert('无法识别');
            }
        }
    });

    // 4 音频接口
    // 4.2 开始录音
    wx.startRecord({
        cancel: function () {
            alert('用户拒绝授权录音');
        }
    });

    // 4.3 停止录音
    wx.stopRecord({
        success: function (res) {
            voice.localId = res.localId;
        },
        fail: function (res) {
            alert(JSON.stringify(res));
        }
    });

    // 4.4 监听录音自动停止
    wx.onVoiceRecordEnd({
        complete: function (res) {
            voice.localId = res.localId;
            alert('录音时间已超过一分钟');
        }
    });

    // 4.6 暂停播放音频
    wx.pauseVoice({
        localId: voice.localId
    });

    // 4.7 停止播放音频
    wx.stopVoice({
        localId: voice.localId
    });

    // 5 图片接口
    // 5.1 拍照、本地选图
    // 5.2 图片预览
    // 5.3 上传图片

    // 5.4 下载图片

    // 6.1 获取当前网络状态
    wx.getNetworkType({
        success: function (res) {
            alert(res.networkType);
        },
        fail: function (res) {
            alert(JSON.stringify(res));
        }
    });

    // 7 地理位置接口
    // 7.1 查看地理位置
    wx.openLocation({
        latitude: 23.099994,
        longitude: 113.324520,
        name: 'TIT 创意园',
        address: '广州市海珠区新港中路 397 号',
        scale: 14,
        infoUrl: 'http://weixin.qq.com'
    });

    // 7.2 获取当前地理位置
    wx.getLocation({
        success: function (res) {
            alert(JSON.stringify(res));
        },
        cancel: function (res) {
            alert('用户拒绝授权获取地理位置');
        }
    });

    // 8.3 批量隐藏菜单项

    // 8.4 批量显示菜单项
    // 8.5 隐藏所有非基本菜单项


    // 10 微信支付接口


    var shareData = {
        title: '微信JS-SDK Demo',
        desc: '微信JS-SDK,帮助第三方为用户提供更优质的移动web服务',
        link: 'http://demo.open.weixin.qq.com/jssdk/',
        imgUrl: 'http://mmbiz.qpic.cn/mmbiz/icTdbqWNOwNRt8Qia4lv7k3M9J1SKqKCImxJCt7j9rHYicKDI45jRPBxdzdyREWnk0ia0N5TMnMfth7SdxtzMvVgXg/0'
    };
    wx.onMenuShareAppMessage(shareData);
    wx.onMenuShareTimeline(shareData);

});

wx.error(function (res) {
    alert(res.errMsg);
});

