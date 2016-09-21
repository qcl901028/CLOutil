//
//  ViewController.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/13.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "ViewController.h"
#import "CLOutil.h"
#import "Test.h"
#import "NSObject+CLExtension.h"
#import "Book.h"
#import "Name.h"
#import "UIControl+CLExtension.h"


@interface ViewController ()<CLTextViewDelegate>

@property (nonatomic ,strong) CLTextView *textView;

@end

@implementation ViewController

- (void)loadView {
    
    UIScrollView *scorllView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    scorllView.contentSize = CGSizeMake(KScreen_Width, KSCreen_Height+200);
    self.view = scorllView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = CGRectMake(0, 0, KScreen_Width, KSCreen_Height-90);
//    [self test1];
//    [self test2];
//    [self test3];
    [self test4];
//    [self test5];
//    [self test6];
//    [self test7];
    [self test9];
    [self test8];
}

- (void)test9 {
    
    
}


- (void)test8 {
   
//    int i = 0;
//    NSAssert(i != 0, @"崩溃吧！少年");
    
//    NSException *exception = [NSException exceptionWithName:@"就是的；爱开发" reason:@"fic" userInfo:@{@"hlads":@"hlasdf"}];
//
//    [exception raise];
    Test *test = [[Test alloc] init];
    test.name = @"name";
//    test.student = @"sudent";
//    test.students = @[@"student",@"student"];
//    test.list = @{@"list":@"List"};
//    test.age = 19;
    
    [CLHelper archiverWithObject:test fileName:@"test"];

    NSLog(@"%@",[CLHelper unarchiverWithFileName:@"test"]);
//
//    [Test keyValuesWithDict:@{}];
    
//   NSString *path = [[NSBundle mainBundle] pathForResource:@"model" ofType:@"json"];
//    NSData *data = [NSData dataWithContentsOfFile:path];
//    
//    Test *test = [Test keyValuesWithData:data];
//    
////   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//    
////    Test *test = [Test keyValuesWithDict:dict];
//    
////    Book *book = test.books[1];
//    
//    NSLog(@"%@",test);
    

}

- (void)test7 {
    
//    NSArray *arr = @[@"网吧1",@"a王王",@"小4李",@"李5四"];
//
//   CLNSLog(@"%@", [[arr chineseToPinYin] compareResultAscending]);
//    
//   CLNSLog(@"%@", [[arr chineseToPinYin] compareResultDescending]);
    
    
}


- (void)test6 {
    
//    NSString *str = @"我去你妹";
//    CLNSLog(@"%@",[str chineseToPinYin]);
    
}


- (void)test5 {
    
//    _textView.left = 0;
//    _textView.top = 0;
//    _textView.width = 200;
//    _textView.height = 200;
//    _textView.maxX = 200;
//    _textView.maxY = 200;

//    _textView.centerX = self.view.center.x;
//    _textView.centerY = 200;
//    
//    _textView.size = CGSizeMake(100, 200);
//    
//    _textView.origin = CGPointMake(10, 100);
    
}


- (void)test4 {
    
//    _textView = [[CLTextView alloc] initWithFrame:CGRectMake(50, 100, 200, 800)];
//    [self.view addSubview:_textView];
//    _textView.placehold = @"我正在测试CLTextView";
//    _textView.textViewDelegate = self;
//    _textView.backgroundColor = [UIColor redColor];
// 
//    _textView.fitToFont = YES;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(50, 100, 200, 800);
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor redColor];
//    btn.userInteractionEnabled = YES;
    
    [btn addtargetDidClickedCallBack:^(UIControl *control) {
       
        NSLog(@"我被点击了%@",control);
        
    }];
    [btn addTargetDidClicked:^(UIView *view) {
        NSLog(@"我被点击了%@",view);
    }];
    

//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 800)];
//    [self.view addSubview:label];
//    label.backgroundColor = [UIColor cyanColor];
//    
//    label.userInteractionEnabled = YES;
//    [_textView addTargetDidClicked:^(UIView *view) {
//       
//        NSLog(@"%@我被点击了",view);
//        
//    }];
}



- (void)test3 {

    CLNSLog(@"%@",[NSBundle bundleIdentifier]);
    CLNSLog(@"%@",[NSBundle bundleName]);
    CLNSLog(@"%@",[NSBundle bundleVersion]);
    CLNSLog(@"%@",[NSBundle bundleDisplayName]);
    CLNSLog(@"%@",[NSBundle bundleBuildVersion]);
    CLNSLog(@"%@",[NSBundle deviceVersion]);
}



// 保存密码
- (void)test2 {
    
    
    [Keychain saveUserName:@"1" password:@"2"];
    
    [Keychain getUserNameAndPassWord:^(NSString *userName, NSString *passWord) {
        
        NSLog(@"%@%@",userName,passWord);
        
    }];
    
    
    CLNSLog(@"%@",[Keychain getPassword]);
    CLNSLog(@"%@",[Keychain getUserName]);
    
}


// 字符串转化
- (void)test1 {
    
    NSDictionary *dict = @{@"name":@"xiao",
                           @"age":@"12",
                           @"message":@{@"name":@"xiao",
                                        @"age":@"12"}
                           };
    
    
    [dict jsonString:^(NSString *jsonString) {
        
        
    } error:^(NSError *error) {
        
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
