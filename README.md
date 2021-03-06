## 后台说明

    后台使用了activeadmin
    访问路径 url/admin
    username: admin@example.com
    password: password

###carrierwave-qiniu
https://github.com/huobazi/carrierwave-qiniu
```
    # just style param
    user.avatar.url(style: 'imageView2/1/w/200')
```

    rails5 upload single file

      https://www.pluralsight.com/guides/ruby-ruby-on-rails/handling-file-upload-using-ruby-on-rails-5-api

## REST API

***

### 七牛token

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/qiniu/token
```
参数: 无
输出: [0, upload_token]

### 登录

***

##### 调用方式
Method: POST
Need:

```
root_url/api/accounts/sign_in
```
参数: username, password
输出: {
    "status": 0,
    "message": "登录成功",
    "user": {
        "id": 39,
        "username": "8375",
        "role": "outworker",
        "token": "z7IevgpDogAVas+Bjnhjp6i7YYLyHiulKG8OBVjA8x1K6pZDsewg6N2fQGOtxAqBnBfCJg+uij72ta4m2y2Vew=="
    }
}


### 登出

***

##### 调用方式
Method: POST
Need: Auth header [Authorization: Token token=6J/ms1LSTc2C5YDpYxO0cPdP72uT1H4vIBznVuALV447xqLCGh0lUqHCx95dgzVnX+ulPcFV7yURJSiaRIuKQA==,username=1234]

```
root_url/api/accounts/sign_out
```
参数: username, password
输出: {
    "status": 0,
    "message": "登录成功",
    "user": {
        "id": 39,
        "username": "8375",
        "role": "outworker",
        "token": "z7IevgpDogAVas+Bjnhjp6i7YYLyHiulKG8OBVjA8x1K6pZDsewg6N2fQGOtxAqBnBfCJg+uij72ta4m2y2Vew=="
    }
}


### 微信token

***

##### 调用方式
Method: GET
Need: Auth header [Authorization: Token token=6J/ms1LSTc2C5YDpYxO0cPdP72uT1H4vIBznVuALV447xqLCGh0lUqHCx95dgzVnX+ulPcFV7yURJSiaRIuKQA==,username=1234]

```
root_url/api/wechat_access_token
```
参数: username, password
输出: {
    "status": 0,
    "message": "登录成功",
    "data": {
        "appId": aa,
        "timestamp": "1231243235",
        "nonceStr": "bbb",
        "signature": "aaaa"
    }
}


### 微信code换取token

***

##### 调用方式
Method: GET
Need:

```
root_url/api/wechat_get_token
```
参数: code
输出: { "access_token":"ACCESS_TOKEN",
"expires_in":7200,
"refresh_token":"REFRESH_TOKEN",
"openid":"OPENID",
"scope":"SCOPE" }


### 微信用户信息

***

##### 调用方式
Method: GET
Need:

```
root_url/api/wechat_userinfo
```
参数: code
输出: {
   "openid":" OPENID",
   " nickname": NICKNAME,
   "sex":"1",
   "province":"PROVINCE"
   "city":"CITY",
   "country":"COUNTRY",
    "headimgurl":    "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/46",
    "privilege":[
    "PRIVILEGE1"
    "PRIVILEGE2"
    ]
    "unionid": "o6_bmasdasdsad6_2sgVt7hMZOPfL"
}


### 区域列表

***

##### 调用方式
Method: GET
Need:

```
root_url/api/users/areas
```
参数:
输出: {"status":0,"message":"获取成功","data":{"areas":[{"id":1,"name":"上海"}]}}


### 所属客户列表

***

##### 调用方式
Method: GET
Need:

```
root_url/api/users/clients
```
参数:
输出: {"status":0,"message":"获取成功","data":{"clients":[{"id":1,"name":"沃尔玛"},{"id":2,"name":"家乐福"},{"id":3,"name":"乐购"}]}}



### 门店列表

***

##### 调用方式
Method: GET
Need:

```
root_url/api/users/shops
```
参数:
输出: {"status":0,"message":"获取成功","data":{"shops":[{"id":1,"name":"綦江九龙大道店"}]}}


### 上级员工(销售员)列表

***

##### 调用方式
Method: GET
Need:

```
root_url/api/users/upper_users
```
参数:
输出: {"status":0,"message":"获取成功","data":{"upper_users":[id: 1, name: "0000-abcd"]}}


### 注册(促销员)

***

##### 调用方式
Method: POST
Need:

```
root_url/api/users
```
参数: role=outworker
username=工号
name=姓名
mobile=18018559077
area_id=1 (区域) (可选)
shop_id=1 (门店)
upper_user_id=1 (上级用户id)
upper_user_phone=18000000000 (上级员工电话)
team_id=1 (团队id，似乎可以不要)
password=123456
openid=dsafpjdqprjioewfjow32j4o3
avatar=头像url

输出: {
    "status": 0,
    "message": "添加用户成功"
}

### 注册(销售员)

***

##### 调用方式
Method: POST
Need:

```
root_url/api/users
```
参数: role=staff
username=1000
name=test
mobile=18018559077
area_id=1
upper_user_phone=18000000000
client_id=所属客户
password=123456
upper_user_name=所属上级
openid=dsafpjdqprjioewfjow32j4o3
avatar=头像url

输出: {
    "status": 0,
    "message": "添加用户成功"
}


### 更新个人信息(所有用户)

***

##### 调用方式
Method: PUT
Need: Auth

```
root_url/api/users/:id
```
参数:
name=姓名
mobile=18018559077
password=123456
avatar=头像url

输出: {
    "status": 0,
    "message": "更新成功"
}


### 同步微信头像

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/users/self_update
```
参数:
avatar=头像url
openid(可选)

输出: {
    "status": 0,
    "message": "更新成功"
}


### 销售员下级(团队促销员)

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/users/sub_users
```
参数: status(approved, unapproved, disapproved)为空则返回全部

输出: {
    "status": 0,
    "message": "获取成功",
    "data": {
        "users": [id, name, fullname, username, mobile, status, short(首字母大写), update_date(提交日期), shop(店名)]
    }
}


### 通过申请(销售员对促销员审核)

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/users/approve_user
```
参数: user_id

输出: {
    "status": 0,
    "message": "审批成功"
}


### 拒绝申请(销售员对促销员审核)

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/users/disapprove_user
```
参数: user_id

输出: {
    "status": 0,
    "message": "审批成功"
}


### 个人信息（我的）

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/users/me
```
参数:

输出: {
    "status": 0,
    "message": "ok",
    "data": {
        "user": {
            "id": 41,
            "name": "test",
            "username": "9000",
            "mobile": "18018559079",
            "role": "销售员",
            "status": "待审批",
            "area": "上海",
            "shop": "綦江九龙大道店",
            "team": "团队",
            "upper_user": "未指定",
            "upper_user_name": null,
            "upper_user_phone": "18000000000",
            "upper_client": null,
            "team_members_count": 0
        }
    }
}


### 活动列表

***

##### 调用方式
Method: GET
Need:

```
root_url/api/events
```
参数: event_type('tg', 'shelf', 'new', 'project') 说明: 地推、货架、上新、项目(选填)

输出: {"status":0,"message":"ok","data":{"events":[{"id":1,"title":"洗护用品促销活动","desc":"","begin_date":"2018-01-01T00:00:00.000+08:00","end_date":"2019-01-01T00:00:00.000+08:00","status":"已开始","image":"http://p3tj4myt5.bkt.clouddn.com/uploads/event/image/1/QQ20120927-6.png","event_type":"地推"}]}}


### 活动详情

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/events/:id
```
参数: id=1

输出: {
    "status": 0,
    "message": "ok",
    "data": {
        "event": {
            "id": 1,
            "title": "联合利华2月亲情大促销莲花路店买二赠一活动",
            "image": {
                "url": "http://p3tj4myt5.bkt.clouddn.com/uploads/event/image/1/ipad__broker_1.png"
            },
            "desc": "联合利华2月亲情大促销莲花路店买二赠一活动联合利华2月亲情大促销莲花路店买二赠一活动联合利华2月亲情大促销莲花路店买二赠一活动",
            "begin_date": "2013年01月01日",
            "end_date": "2023年04月04日",
            "status": "已开始",
            "goods": [
                {
                    "good_id": 1,
                    "brand": "蓝月亮",
                    "name": "洗手液250ml",
                    "price": "231.5",
                    "image": {
                        "url": "http://p3tj4myt5.bkt.clouddn.com/uploads/good/image/1/%E6%9B%BF%E6%8D%A2%E6%96%87%E6%9C%AC.jpg"
                    }
                },
                {
                    "good_id": 2,
                    "brand": "蓝月亮",
                    "name": "洗手液500ml",
                    "price": "73.5",
                    "image": {
                        "url": "http://p3tj4myt5.bkt.clouddn.com/uploads/good/image/2/%E6%A3%80%E6%9F%A5%E5%8E%9F%E5%9B%A02.jpg"
                    }
                }
            ]
        }
    }
}


### 当前活动详情

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/events/current_event
```
参数: event_type(tg, new, project, shelf)

输出: {
    "status": 0,
    "message": "ok",
    "data": {
        "event": {
            "id": 1,
            "title": "联合利华2月亲情大促销莲花路店买二赠一活动",\
            image 图片url
            desc 详情说明
            begin_date 开始日期
            end_date 结束日期
            status 状态
            event_type 类型
            "image": {
                "url": "http://p3tj4myt5.bkt.clouddn.com/uploads/event/image/1/ipad__broker_1.png"
            },
            "desc": "联合利华2月亲情大促销莲花路店买二赠一活动联合利华2月亲情大促销莲花路店买二赠一活动联合利华2月亲情大促销莲花路店买二赠一活动",
            "begin_date": "2013年01月01日",
            "end_date": "2023年04月04日",
            "status": "已开始",
            "goods": [
                {
                    "good_id": 1,
                    "brand": "蓝月亮",
                    "name": "洗手液250ml",
                    "price": "231.5",
                    "image": {
                        "url": "http://p3tj4myt5.bkt.clouddn.com/uploads/good/image/1/%E6%9B%BF%E6%8D%A2%E6%96%87%E6%9C%AC.jpg"
                    }
                },
                {
                    "good_id": 2,
                    "brand": "蓝月亮",
                    "name": "洗手液500ml",
                    "price": "73.5",
                    "image": {
                        "url": "http://p3tj4myt5.bkt.clouddn.com/uploads/good/image/2/%E6%A3%80%E6%9F%A5%E5%8E%9F%E5%9B%A02.jpg"
                    }
                }
            ]
        }
    }
}


### 用户活动列表

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/events/user_events?id=
```
参数: id=1 (是user id)

输出: {
    "status": 0,
    "message": "ok",
    "data": {
        "events": []
    }
}


### 用户提交的执行数据列表

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/events/user_datums
```
参数: user_id, event_id

输出: {
    "status": 0,
    "message": "ok",
    "data": {
        "datums": [datum_id, event, good, good_price, good_image, in_num, sell_num, storage_num, status, comment]
    }
}


### 下辖促销员提交的执行数据列表

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/events/sub_user_datums
```
参数:

输出:{
    "status": 0,
    "message": "ok",
    "data": {
        "datums": [
            {
                "datum_id": 10,
                "event": "联合利华2月亲情大促销莲花路店买二赠一活动",
                "good": "蓝月亮洗手液500ml",
                "good_price": "73.5",
                "good_image": "http://p3tj4myt5.bkt.clouddn.com/uploads/good/image/2/%E6%A3%80%E6%9F%A5%E5%8E%9F%E5%9B%A02.jpg",
                "in_num": 4,
                "sell_num": 34,
                "storage_num": 1,
                "status": "已审批",
                "create_date": "2018年02月12日",
                "create_time": "02:19",
                "approve_date": "2018年02月13日",
                "approve_time": "02:06",
                "comment": "123"
            }


### 提交执行数据

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/events/submit_data
```
参数: event_id, good_id, in_num(进), sell_num(销), storage_num(存)

输出: {
    "status": 0,
    "message": "提交成功"
}


### 审批执行数据

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/events/datum_approve
```
参数: datum_id, flag("approve", "disapprove"), comment(审批意见)

输出: {
    "status": 0,
    "message": "审核成功"
}


### 动态列表

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/states
```
参数: state_type('tg', 'shelf', 'new', 'project') 说明: 地推、货架、上新、项目(必填), user_id(可选)

输出: {
    "status": 0,
    "message": "ok",
    "data": {
        "me": {
            "user_id": 12,
            "username": "1002",
            "name": "liuzhaoxiang",
            "avatar": "http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg"
        },
        "states": [
            {
                "note": "我来发一个圈圈",  "这里是促销填的动态说明"
                "comment": null,  "这里是销售填的批注"
                "state_status": "待审批",
                "photo_type": "地推",
                "photos": [
                    {
                        "photo_id": 20,
                        "order": 1,
                        "image": "http://p3tj4myt5.bkt.clouddn.com/o_1c65o48ar1shs1lj02kp13mo1lkku.png"
                    },
                    {
                        "photo_id": 21,
                        "order": 2,
                        "image": "http://p3tj4myt5.bkt.clouddn.com/o_1c65o4f6l849ik512891ugq1mjm13.png"
                    }
                ],
                "count": 9,
                "user": {
                    "user_id": 15,
                    "username": "7658",
                    "name": "52d5"
                }
            }
        ]
    }
}


### 新建动态

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/states
```
参数: event_id 活动id, state_type('tg', 'shelf', 'new', 'project'), note 说明, photos[image] 照片(数组), location 地址

输出: {
    "status": 0,
    "message": "提交成功"
}


### 审批动态

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/states/state_approve
```
参数: id(是state_id), flag("approve", "disapprove"), comment(评论)

输出: {
    "status": 0,
    "message": "审核成功"，
    "data": 状态("已审批", "否决")
}


### 评论(批注)动态

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/states/state_comment
```
参数: id(是state_id), comment(评论 string)

输出: {
    "status": 0,
    "message": "提交成功"
}



## model 说明
* 除了login，所有的请求都要带token，格式是`-H "Authorization: Token token=token, username=username"`
*


### user 用户
```
username: 用户代码, mobile: 手机, role: 角色（admin, staff, outworker）, area_id: 区域, shop_id: 店, upper_user_id: 上级（销售）, upper_user_phone: 上级电话, team_id: 团队, name: 姓名, status: 状态（待审批/已审批）

belongs_to :area 区域（上海、北京。。）
belongs_to :team 团队
belongs_to :shop 店

has_many :events 活动
has_many :datums 活动数据
has_many :photos 活动照片
```


### event 活动
```
title: 活动名称, image: 照片, desc: 简介说明, begin_date: 开始日期, end_date: 截止日期, send_to: 提醒人email, user_id: 提醒用户, notice: 提示内容, status: 状态(未开始、已开始、已结束)

has_many :goods
has_many :users
```


### good 商品
```
event_id: 活动, brand: 品牌, name: 商品名称, image: 图片

belongs_to :event
has_many :datums
```


### Photo 活动照片
```
user_id: 上传用户, event_id: 活动, type: 类型（货架、推头、物料）, image: 照片url, order: 排序(1..2..3..4), serial_code: 编号（后台监控用）, status: 状态(待审批、已审批、已否决)

belongs_to :user
belongs_to :event
```


### Datum 活动数据
```
user_id: 上传用户, event_id: 活动, good_id: 商品, in_num: 进货数量, sell_num: 销售数量, budget_num: 清货数量, storage_num: 库存数量, status: 状态(待审批、已审批、已否决)

belongs_to :user
belongs_to :event
```
