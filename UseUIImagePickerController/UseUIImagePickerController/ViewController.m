//
//  ViewController.m
//  UseUIImagePickerController
//
//  Created by baishiqi on 16/7/7.
//  Copyright © 2016年 baishiqi. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

#define BUTTON_WIDTH 100
#define BUTTON_HEIGHT 100

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((CGRectGetWidth(self.view.bounds) - BUTTON_WIDTH) / 2, (CGRectGetHeight(self.view.bounds) - BUTTON_WIDTH) / 2, BUTTON_WIDTH, BUTTON_HEIGHT);
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked:(UIButton *)button
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
//    [mediaTypes addObject:( NSString *)kUTTypeImage];
    [mediaTypes addObject:( NSString *)kUTTypeMovie];
    picker.allowsEditing = YES;
    [picker setMediaTypes:mediaTypes];
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"%@", info);
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
