//
//  CLTextView.m
//  dsc
//
//  Created by hezhijingwei on 16/9/13.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "CLTextView.h"

@interface CLTextView ()<UITextViewDelegate>


// 原始高度
@property (nonatomic, assign) CGFloat firsthandHeight;

@property (nonatomic, assign) CGFloat length;

@end


@implementation CLTextView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.bounces = NO;
        self.delegate = self;
        [self addSubview:self.placeholdLabel];
        self.scrollEnabled = NO;
        self.fitToFont = YES;
        self.firsthandHeight = self.frame.size.height;
        self.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)setFitToFont:(BOOL)fitToFont {

    if (fitToFont) {
        self.scrollEnabled = NO;
    } else {
        self.scrollEnabled = YES;
    }
    _fitToFont = fitToFont;
}


- (UILabel *)placeholdLabel {
    
    if (!_placeholdLabel) {
        _placeholdLabel = [[UILabel alloc] init];
        _placeholdLabel.textColor = [UIColor grayColor];
        _placeholdLabel.font = [UIFont systemFontOfSize:14];
        _placeholdLabel.numberOfLines = 0;
        
        
        CGFloat height = 20;
        if (self.placehold != nil && ![self.placehold isEqualToString:@""]) {
           height = [self getContentSize:self.placehold width:self.bounds.size.width - 10 font:[UIFont systemFontOfSize:14]].height;

        }
        
        if (height > self.bounds.size.height) {
            height = self.bounds.size.height - self.textContainerInset.top*2;
        }
        
       _placeholdLabel.frame = CGRectMake(5, self.textContainerInset.top, self.bounds.size.width - 10, height);
    }
    return _placeholdLabel;
}

- (void)setPlacehold:(NSString *)placehold {
    
    self.placeholdLabel.text = placehold;
    
    _placehold = placehold;
    
    
    CGFloat height = [self getContentSize:placehold width:self.bounds.size.width - 10 font:[UIFont systemFontOfSize:14]].height;
    
   CGRect frame = self.placeholdLabel.frame;
    
    
    if (height > self.bounds.size.height) {
        height = self.bounds.size.height - 10;
    }
    frame.size.height = height;
    self.placeholdLabel.frame = frame;
    
}


- (CGSize)getContentSize:(NSString *)content width:(CGFloat)width font:(UIFont *)font {
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineBreakMode = self.textContainer.lineBreakMode;
    
    NSDictionary *attributes = @{NSFontAttributeName:font,NSParagraphStyleAttributeName:[paragraphStyle copy]};
    
    CGSize size = [content boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                        options:NSStringDrawingTruncatesLastVisibleLine
                                                | NSStringDrawingUsesLineFragmentOrigin
                                                | NSStringDrawingUsesFontLeading
                                                | NSStringDrawingUsesDeviceMetrics
                                     attributes:attributes
                                        context:nil].size;
        
        return size;
        
    
    
    
}


- (void)textViewDidChangeSelection:(UITextView *)textView {
    
    if (textView.text.length) {
        
        self.placeholdLabel.text = @"";
        [self.placeholdLabel removeFromSuperview];
        self.placeholdLabel = nil;
        
    } else {
        
        [self addSubview:self.placeholdLabel];
        self.placeholdLabel.text = self.placehold;
        
    }
    
    CGFloat broadWidth = (  textView.contentInset.left
                          + textView.contentInset.right
                          + textView.textContainerInset.left
                          + textView.textContainerInset.right
                          + textView.textContainer.lineFragmentPadding*2);
    
    CGFloat broadHeight = (  textView.contentInset.top
                           + textView.contentInset.bottom
                           + textView.textContainerInset.top
                           + textView.textContainerInset.bottom);
    
    
    
    CGSize size = [self getContentSize:textView.text width:self.bounds.size.width-broadWidth font:[UIFont systemFontOfSize:14]];
    
        if (self.fitToFont && self.firsthandHeight <= size.height+broadHeight) {
            
            
            
            CGRect frame = self.frame;
            
            frame.size.height = size.height+broadHeight;
            
            self.frame = frame;
        } else {
            
            CGRect frame = self.frame;
            
            frame.size.height = self.firsthandHeight;
            self.frame = frame;

        }
    
    
    if (_textViewDelegate && [_textViewDelegate respondsToSelector:@selector(textViewDidChangeSelection:)]) {
        
        [_textViewDelegate textViewDidChangeSelection:textView];
    }
    
}



- (void)textViewDidChange:(UITextView *)textView {
    
    
    if (_textViewDelegate && [_textViewDelegate respondsToSelector:@selector(textViewDidChange:)]) {
        
        [_textViewDelegate textViewDidChange:textView];
        
    }
    
}



- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    if (textView.text.length) {
        
        self.placeholdLabel.text = @"";
        [self.placeholdLabel removeFromSuperview];
        self.placeholdLabel = nil;
    }
    
    
    if (_textViewDelegate && [_textViewDelegate respondsToSelector:@selector(textViewDidBeginEditing:)]) {
        
        [_textViewDelegate textViewDidBeginEditing:textView];
        
    }
    
}





- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {

    if (_textViewDelegate && [_textViewDelegate respondsToSelector:@selector(textViewShouldBeginEditing:)]) {
        return [_textViewDelegate textViewShouldBeginEditing:textView];
    }
    
    return YES;
}


- (BOOL)textViewShouldEndEditing:(UITextView *)textView{

    
    if (_textViewDelegate && [_textViewDelegate respondsToSelector:@selector(textViewShouldEndEditing:)]) {
        return [_textViewDelegate textViewShouldEndEditing:textView];
    }
    
    return YES;
    
    
}


- (void)textViewDidEndEditing:(UITextView *)textView{
    
    if (_textViewDelegate && [_textViewDelegate respondsToSelector:@selector(textViewDidEndEditing:)]) {
        
        [_textViewDelegate textViewDidEndEditing:textView];
        
    }
    
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

    if (_textViewDelegate && [_textViewDelegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        
        return [_textViewDelegate textView:textView shouldChangeTextInRange:range replacementText:text];
        
    }
    return YES;
    
}


- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    
    if (_textViewDelegate && [_textViewDelegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        
        return [_textViewDelegate textView:textView shouldInteractWithURL:URL inRange:characterRange];
        
    }
    return YES;
    
    
}


- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange{
    
    if (_textViewDelegate && [_textViewDelegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        
        return [_textViewDelegate textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange];
        
    }
    return YES;
    
}


@end
