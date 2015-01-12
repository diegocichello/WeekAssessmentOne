//
//  ViewController.m
//  WeekAssessmentOne
//
//  Created by Diego Cichello on 1/9/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "RootViewController.h"
#import "WebViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UITextField *operandOneTextField;
@property (weak, nonatomic) IBOutlet UITextField *operandTwoTextField;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *webButton;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webButton.enabled = false;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCalculateButtonPressed:(id)sender
{
    float operandOneNumber = [self.operandOneTextField.text floatValue];
    float operandTwoNumber = [self.operandTwoTextField.text floatValue];

    [self resignKeyboards];

    int calculation = operandOneNumber * operandTwoNumber;


    self.webButton.enabled = (calculation%5 == 0);



    self.navigationBar.title = [NSString stringWithFormat:@"%.2d",calculation];


}

- (IBAction)prepareforUnwindSegue:(UIStoryboardSegue *)segue
{

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *webVC = segue.destinationViewController;
    webVC.calculationResult = self.navigationBar.title;
   
    

}

- (void) resignKeyboards
{
    [self.operandOneTextField resignFirstResponder];
    [self.operandTwoTextField resignFirstResponder];
}

@end
