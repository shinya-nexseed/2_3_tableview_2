//
//  ViewController.m
//  2_3_tableview_2
//
//  Created by Shinya Hirai on 2015/07/15.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray *_myData1;
    NSArray *_myData2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    _myData1 = @[@"バウムクーヘン",@"チーズケーキ",@"フルーツロール"];
    _myData2 = @[@"手焼き煎餅",@"みたらし団子",];
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return _myData1.count;
    } else {
        return _myData2.count;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"洋菓子";
    } else {
        return @"和菓子";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
//    cell.textLabel.text = [NSString stringWithFormat:@"行=%ld", (long)indexPath.row];

    if (indexPath.section == 0) {
        cell.textLabel.text = _myData1[indexPath.row];
    } else {
        cell.textLabel.text = _myData2[indexPath.row];
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
