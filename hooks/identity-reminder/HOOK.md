# Identity Reminder Hook

## 描述
在Agent启动时注入身份系统提醒，确保Agent正确使用双重身份系统。

## 功能
- 在agent:bootstrap事件时触发
- 注入身份提醒虚拟文件
- 提醒Agent默认身份是AI助手
- 明确切换到大象身份的条件

## 触发条件
- 事件类型：agent
- 事件动作：bootstrap
- 触发时机：Agent启动时，在workspace文件注入之前

## 注入内容
虚拟文件：`IDENTITY_REMINDER.md`
内容：身份系统说明、默认身份、切换条件、重要规则

## 配置
无需额外配置，安装后自动启用。

## 依赖
无外部依赖，纯JavaScript实现。

## 安全说明
- 只注入虚拟文件，不修改物理文件
- 只读取事件数据，不访问外部资源
- 代码经过安全检查