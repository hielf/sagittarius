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
area_id=1 (区域)
shop_id=1 (门店)
upper_user_id=1 (上级用户id)
upper_user_phone=18000000000 (上级员工电话)
team_id=1 (团队id，似乎可以不要)
password=123456

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
upper_client=所属客户
password=123456

输出: {
    "status": 0,
    "message": "添加用户成功"
}


### 人员信息(按id)

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/users/user_detail?id=123
```
参数: id=123

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


### 销售员下级(团队促销员)

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/users/sub_users
```
参数:

输出: {
    "status": 0,
    "message": "获取成功",
    "data": {
        "users": [id, name, status]
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
参数:

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
参数:

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
        "datums": [datum_id, event, good, good_price, good_image, in_num, sell_num, storage_num, status]
    }
}

### 用户提交的照片列表

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/events/user_photos
```
参数: user_id, event_id

输出: {
    "status": 0,
    "message": "ok",
    "data": {
        "serials":
        [count,
        serial_code,
        status,
        "photos": [photo_id, order, image, photo_type]
        ]
    }
}


### 提交执行数据

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/events/submit_photos
```
参数: event_id, good_id

输出: {
    "status": 0,
    "message": "提交成功"
}


### 上传照片(每次提交一张照片,同一批提交的照片会生成同一个serial_code,用户之后的审批)

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/events/submit_data
```
参数: event_id, photo_type("tg")

输出: {
    "status": 0,
    "message": "成功"
}


### 审批执行数据

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/events/datum_approve
```
参数: datum_id, flag("approve", "disapprove")

输出: {
    "status": 0,
    "message": "审核成功"
}


### 审批照片

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/events/photos_approve
```
参数: serial_code, flag("approve", "disapprove")

输出: {
    "status": 0,
    "message": "审核成功"
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
