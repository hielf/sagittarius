### instruction
* 除了login，所有的请求都要带token，格式是`-H "Authorization: Token token=token, username=username"`
*

```
### login
```bash
curl -X POST -d "username=foo&password=password" http://police.iot/api/accounts/sign_in
```


# api by moumou
## 导入用户

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/users/import_users
```

## 导出分局

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/stations/export
```

## 导入分局

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/stations/import
```

## 导出供应商

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/suppliers/export
```

## 导入供应商

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/suppliers/import
```

## 机架查询

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/cases
```
输入参数

q[name]	false	str		机架名称（模糊查询）
q[ip]	false	str		IP地址
q[station_id_eq]	false	int		所属分局ID
page	false	int	1	第几页
per	false	int	20	每页条数 (1..100)

返回

name 机架名称,
station_id 所属分局id,
ip ip地址,
port 端口,
sub_net_ip 子网ip,
sub_net_port_begin 子网起始端口,
sub_net_port_end 子网结束端口
station_name 所属分局名称

## 单一机架查询

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/cases/:id
```
输入参数

id	true	int		机箱ID

返回

name 机架名称,
station_id 所属分局id,
ip ip地址,
port 端口,
sub_net_ip 子网ip,
sub_net_port_begin 子网起始端口,
sub_net_port_end 子网结束端口
station_name 所属分局名称

## 创建 机架

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/cases
```
输入参数

name true str 机架名称,
station_id true int 所属分局id,
ip true str ip地址,
port true str 端口,
sub_net_ip false str 子网ip,
sub_net_port_begin false str 子网起始端口,
sub_net_port_end false str 子网结束端口

返回

{
  "code": 0,
  "message": "创建成功"
}


## 更新 机架

***

##### 调用方式
Method: PUT/PATCH
Need: Auth

```
root_url/api/cases/:id
```
输入参数

id	true	int		机箱ID
name true str 机架名称,
station_id true int 所属分局id,
ip true str ip地址,
port true str 端口,
sub_net_ip false str 子网ip,
sub_net_port_begin false str 子网起始端口,
sub_net_port_end false str 子网结束端口

返回

{
  "code": 0,
  "message": "更新成功"
}


## 删除 机架

***

##### 调用方式
Method: DELETE
Need: Auth

```
root_url/api/cases/:id
```
输入参数

id	true	int		机箱ID

返回

{
  "code": 0,
  "message": "删除成功"
}


## 导出 机架

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/cases/export
```

## 导入 机架

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/cases/import
```


## 导出 设备

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/powers/export
```

## 导入 设备

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/powers/import
```

## 导出 设备基础维护

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/options/export
```

## 导入 设备基础维护

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/options/import
```

## 导出 工单

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/work_orders/export
```

## 导入 工单

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/work_orders/import
```

## 统计接口 工单统计

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/work_orders/statistics
```
参数: 无
输出: 未读数、未读数查询参数、已读数、已读查询参数、未处理数、未处理查询参数、已处理数、查询参数..


## 统计接口 工单统计明细

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/work_orders/statistics_detail
```
参数: page per type("has_read" or "deal_status") status(true or false)
|| 输出: 同work_orders index

## 导出 报警

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/notices/export
```


## 电源接口 重置

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/powers/reset_port
```
参数: id (电源接口)


## 电源接口 列表

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/powers/power_ports
```
参数: id (电源) ||  输出：id, voltage 电压, item(类型: ac dc), power_type(子类: 220v 20v 16v), option_type:分类, serial:序号, status: 状态, brand: 品牌, model: 型号


## 电源接口 开启

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/powers/power_port_on
```
参数: id (电源接口)


## 电源接口 关闭

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/powers/power_port_off
```
参数: id (电源接口)


## 电源接口 修改

***

##### 调用方式
Method: POST
Need: Auth

```
root_url/api/powers/modify_power_port
```
参数: id (电源接口)


## 统计接口 报警统计

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/notices/statistics
```
参数: 无
输出: unread:未读数、unread_params:未读数查询参数、已读数、已读查询参数、unread_1:直流电源故障、unread_2:交流电源故障、unread_3:板卡不在、unread_4:温度异常


## 统计接口 设备统计

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/powers/statistics
```
参数: 无
输出: {data: {cases: {all_cases:机架数}, powers: {all_powers:电源数, normal:正常, abnormal:异常, unconnect:不在线}. power_ports: {all_power_ports:接口数}}}


## 统计接口 我的工单列表

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/work_orders/work_orders_list
```
参数: page per type("all" or "not" or "deal")
说明: all=全部， not=未完成， deal=已完成
|| 输出: 同work_orders index


## 外勤人员 直接用这个
***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/users?role=outworker
```
参数: username, name, password, role, station_id
|| 输出: users index


## 获取微信access_token
***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/wechat_access_token
```
参数:
|| 输出: {
    "access_token": "6_1UBnwwF-RDEJaR-Ex0iFGyIdyj6zSoq3U-6PRwMlmHXduIZngzCrCHc3eCPxfa86qupu9H1BhdO-DMGvHyyg7P_j1hyLskW29Wboc0ZH1_9pb3sZuxMVsniNkYf_59o-5X11YFl0whSWoUYuUSObAIAOMI",
    "got_token_at": 1516983247,
    "token_expires_in": 7200,
    "ticket": "bxLdikRXVbTPdHSM05e5uzoWR1XWEexv0YJz3JzGrvfT7TJxyP2l_xlruApzrVZLA8F5xlqT6AcYtVWrJxvKbg"
}

## 电源设备 获取附近30米范围内的所有设备列表

***

##### 调用方式
Method: GET
Need: Auth

```
root_url/api/powers/near_by_powers
```
参数: latitude, longitude
|| 输出: 同powers index

##### 输入参数
| 参数 | 是否必选 | 类型 | 默认值 | 说明 |
| :----: | :----: |:----: |:----: |:----: |
| file | true | file |  | token |


##### 请求实例
root_url/api/users/import_users
