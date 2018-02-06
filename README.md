### model 说明
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
