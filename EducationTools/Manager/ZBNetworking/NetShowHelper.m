//
//  NetShowHelper.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/9.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "NetShowHelper.h"

@implementation NetShowHelper

+(void)showTip:(id)response{
    switch ([[response objectForKey:@"result"] intValue]) {
        case 0:
            break;
        case 1:
            [MBProgressHUD showError:@"失败" toView:nil];
            break;
        case 2:
            [MBProgressHUD showError:@"参数错误" toView:nil];
            break;
        case 3:
            [MBProgressHUD showError:@"获取数据库连接失败" toView:nil];
            break;
        case 4:
            [MBProgressHUD showError:@"获取数据库连接失败" toView:nil];
            break;
        case 5:
            [MBProgressHUD showError:@"重复注册用户" toView:nil];
            break;
        case 6:
            [MBProgressHUD showError:@"提交用户注册失败" toView:nil];
            break;
        case 7:
            [MBProgressHUD showError:@"token不存在" toView:nil];
            break;
        case 8:
            [MBProgressHUD showError:@"token超时无效" toView:nil];
            break;
        case 9:
            [MBProgressHUD showError:@"用户注册" toView:nil];
            break;
        case 10:
            [MBProgressHUD showError:@"获取验证码失败" toView:nil];
            break;
        case 11:
            [MBProgressHUD showError:@"发送短信失败" toView:nil];
            break;
        case 12:
            [MBProgressHUD showError:@"执行sql语句失败" toView:nil];
            break;
        case 13:
            [MBProgressHUD showError:@"token错误" toView:nil];
            break;
        case 14:
            [MBProgressHUD showError:@"authcode验证码错误" toView:nil];
            break;
        case 15:
            [MBProgressHUD showError:@"数据库查询错误" toView:nil];
            break;
        case 16:
            [MBProgressHUD showError:@"审批未通过" toView:nil];
            break;
        case 17:
            [MBProgressHUD showError:@"用户名或密码错误" toView:nil];
            break;
        case 18:
            [MBProgressHUD showError:@"获取唯一校验码失败" toView:nil];
            break;
        case 19:
            [MBProgressHUD showError:@"未处理的接口" toView:nil];
            break;
        case 20:
            [MBProgressHUD showError:@"没有查询到数据" toView:nil];
            break;
        case 21:
            [MBProgressHUD showError:@"准备数据失败" toView:nil];
            break;
        case 22:
            [MBProgressHUD showError:@"配置文件错误" toView:nil];
            break;
        default:
            break;
    }
}
@end
