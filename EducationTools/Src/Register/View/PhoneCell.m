//
//  PhoneCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/3.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PhoneCell.h"
#import "LYHTTPClient.h"
@interface PhoneCell()

@property (nonatomic,strong) UIButton * chechButton;

@end

@implementation PhoneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(UIButton*)chechButton{
    if(!_chechButton){
        _chechButton = [FactoryUI createButtonWithFrame:CGRectMake(0, 0, 0, 0) title:@"获取验证码" titleColor:[UIColor whiteColor] imageName:nil backgroundImageName:nil target:self selector: @selector(getCheckID:)];
        _chechButton.layer.cornerRadius = 5;
        _chechButton.backgroundColor = [UIColor grayColor];
    }
    return _chechButton;
}

-(void)configView{
    
    self.name = [[UILabel alloc] init];
    self.name.text = @"联系方式:";
    self.name.font = LabelFont;
    
    self.phoneTF = [[UITextField alloc] init];
    [self.phoneTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:_phoneTF];
    
    [self.contentView addSubview:self.chechButton];
    
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.width.equalTo(self.contentView).multipliedBy(0.2);
        make.height.mas_equalTo(@50);
    }];
    
    [self.chechButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.contentView).offset(5);
        make.height.mas_equalTo(@40);
        make.width.mas_equalTo(@100);
    }];
    
    [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name.mas_right).offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(50);
        make.right.equalTo(self.chechButton.mas_left).offset(-10);
    }];
    
}

-(void)textFieldDidChange:(UITextField *)theTextField{
    self.contetModel.value1 = self.phoneTF.text;
}

/**
 获取验证ID

 @param btn
 */
- (void)getCheckID:(UIButton *)btn{
    [self openCountdown];
    [self upload];
    
}

-(NSString*)ObjectTojsonString:(id)object
{
    
    NSString *jsonString = [[NSString alloc]init];
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                        
                                                      options:NSJSONWritingPrettyPrinted
                        
                                                        error:&error];
    
    if (! jsonData) {
        
        NSLog(@"error: %@", error);
        
    } else {
        
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    [mutStr replaceOccurrencesOfString:@" "withString:@""options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    [mutStr replaceOccurrencesOfString:@"\n"withString:@""options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}
//dic 转json 如果用系统自带的会出现空格。
+ (NSString *)returnJSONStringWithDictionary:(NSDictionary *)dictionary{
    
    //系统自带
    
    //    NSError * error;
    
    //    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&error];
    
    //    NSString * jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    //自定义
    
    NSString *jsonStr = @"{";
    
    NSArray * keys = [dictionary allKeys];
    
    for (NSString * key in keys) {
        
        jsonStr = [NSString stringWithFormat:@"%@\"%@\":\"%@\",",jsonStr,key,[dictionary objectForKey:key]];
        
    }
    
    jsonStr = [NSString stringWithFormat:@"%@%@",[jsonStr substringWithRange:NSMakeRange(0, jsonStr.length-1)],@"}"];
    
    return jsonStr;
    
}

- (void)upload{
    
    NSMutableDictionary * dict = [NSMutableDictionary new];
    [dict setObject:self.phoneTF.text forKey:@"phone"];
    
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    [[ZBNetworking shaerdInstance]uploadJsonDataWithUrl:Authcode jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"%@",response);
        if ([response objectForKey:@"result"] == 0) {
            //获取验证码成功
        }else{
            
        }
    } failBlock:^(NSError *error) {
        
    }];
    
}
-(void)upload1
{
    NSMutableDictionary * dict = [NSMutableDictionary new];
    NSInteger num = 1;
    NSNumber *ii = [NSNumber numberWithInteger:1];
//    [dict setValue:ii forKey:@"mode"];
    dict = @{@"mode":@1};
    
    NSDictionary * ui = @{@"mode":@"1"};
    NSData * daaa1 = [NSJSONSerialization dataWithJSONObject:ui options:0 error:nil];
//    [dict setObject:ii forKey:@"mode"];
//    [dict setValue:num forKey:@"mode"];
//    [dict setValue:@"13046008202" forKey:@"phone"];
    NSString * jsonString = [self ObjectTojsonString:@{@"phone":@"13046008202"}];
    NSData * daaa = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSString * aaaa = [PhoneCell returnJSONStringWithDictionary:dict];
    NSString * yyy = [[NSString alloc]initWithData:daaa encoding:NSUTF8StringEncoding];
    NSData * d = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSData * data = [@"123" dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSError * error;
//    NSData * data = [NSJSONSerialization dataWithJSONObject:@{@"phone":@"15866673935"} options:NSJSONWritingPrettyPrinted error:&error];
//    NSData * data2 = [NSJSONSerialization dataWithJSONObject:aaaa options:NSJSONWritingPrettyPrinted error:&error];
    //1.创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 20;
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    [manager.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];
//    manager.re
    
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [manager.requestSerializer setValue:@"text/html; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"text/plain",@"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
//    manager.requestSerializer
    [manager.requestSerializer setValue:@"multipart/form-data;boundary=---------------------------7d33a816d302b6 " forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setValue:@"123" forHTTPHeaderField:@"x-access-id"];
//    [manager.requestSerializer setValue:@"123" forHTTPHeaderField:@"x-signature"];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //2.发送请求上传文件
    /*
     第一个参数:请求路径(NSString)
     第二个参数:非文件参数
     第三个参数:constructingBodyWithBlock 拼接数据(告诉AFN要上传的数据是哪些)
     第四个参数:progress 进度回调
     第五个参数:success 成功回调
     responseObject:响应体
     第六个参数:failure 失败的回调
     */
//    [manager setTaskWillPerformHTTPRedirectionBlock:^NSURLRequest * _Nullable(NSURLSession * _Nonnull session, NSURLSessionTask * _Nonnull task, NSURLResponse * _Nonnull response, NSURLRequest * _Nonnull request) {
//        NSLog(@"%@", request.URL);
//        // This will be called if the URL redirects
//        return request;
//    }];
    
    [manager POST:@"http://140.143.196.13:2500/query/school" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
//        NSData *data = [NSData dataWithContentsOfFile:@"/Users/apple/Desktop/Snip20160409_148.png"];
        //拼接数据
        /*
         第一个参数:文件参数 (二进制数据)
         第二个参数:参数名~file
         第三个参数:该文件上传到服务器以什么名称来保存
         第四个参数:
         */
        NSString *boundary = @"wfWiEWrgEFA9A78512weF7106A";
        NSString *filePair = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\";Content-Type=%@\r\n\r\n",boundary,@"jsondata",@"form-data"];
//        formData app
//        [formData appendPartWithHeaders:@{@"Content-Type":filePair} body:data];
        [formData appendPartWithFormData:daaa name:@"jsondata"];
        NSDictionary * ss = [NSJSONSerialization JSONObjectWithData:daaa options:0 error:nil];
        
//        manager.tasks
//        NSString * yyy1 = [[NSString alloc]initWithData:formData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",formData);
//        [formData appendPartWithFileData:data name:@"file" fileName:@"123.png" mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if ([task.response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSHTTPURLResponse *r = (NSHTTPURLResponse *)task.response;
            NSLog(@"%@",[r allHeaderFields]);
        }
        NSLog(@"success--%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure -- %@",error);
    }];
}


// 开启倒计时效果
-(void)openCountdown{
    
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.chechButton setTitle:@"重新发送" forState:UIControlStateNormal];
                [self.chechButton setTitleColor:kUIColorFromRGB(0xFB8557) forState:UIControlStateNormal];
                self.chechButton.userInteractionEnabled = YES;
            });
            
        }else{
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.chechButton setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [self.chechButton setTitleColor:kUIColorFromRGB(979797) forState:UIControlStateNormal];
                self.chechButton.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
