//
//  CLTextView.h
//  dsc
//
//  Created by hezhijingwei on 16/9/13.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CLTextViewDelegate <NSObject>

@optional

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
- (BOOL)textViewShouldEndEditing:(UITextView *)textView;

- (void)textViewDidBeginEditing:(UITextView *)textView;
- (void)textViewDidEndEditing:(UITextView *)textView;

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)textViewDidChange:(UITextView *)textView;

- (void)textViewDidChangeSelection:(UITextView *)textView;

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0);
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange;



@end



@interface CLTextView : UITextView

/**
 *  设置placeHold
 */
@property (nonatomic ,strong) NSString *placehold;

// 设置代理
@property (nonatomic ,weak) id <CLTextViewDelegate> textViewDelegate;

// default is Yes 设置字体自适应
@property (nonatomic, assign) BOOL fitToFont;

// 可以根据自己的需要定义placeholdLabl
@property (nonatomic ,strong) UILabel *placeholdLabel;

@end
