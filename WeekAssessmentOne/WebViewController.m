//
//  WebViewController.m
//  WeekAssessmentOne
//
//  Created by Diego Cichello on 1/9/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.title = self.calculationResult;
    [self goToURL:@"http://mobilemakers.co"];
    self.webView.delegate = self;
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];
    self.spinner.hidden = false;

}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
    self.spinner.hidden = true;
}

- (void) goToURL:(NSString *)string
{
    NSURL *addressUrl = [NSURL URLWithString:string];
    NSURLRequest *addressRequest = [NSURLRequest requestWithURL:addressUrl];
    [self.webView loadRequest:addressRequest];

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
