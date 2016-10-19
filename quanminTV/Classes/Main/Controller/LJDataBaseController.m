//
//  LJDataBaseController.m
//  quanminTV
//
//  Created by liang on 16/10/19.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJDataBaseController.h"
#import "FMDB.h"

@interface LJDataBaseController ()
@property (nonatomic, strong) FMDatabase *db;

@end

@implementation LJDataBaseController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)creatDb {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [doc stringByAppendingPathComponent:@"student.sqlite"];
    FMDatabase *db = [FMDatabase databaseWithPath:fileName];
    if ([db open]) {
        BOOL result=[db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
        if (result) {
            NSLog(@"建表成功");
        }else {
            NSLog(@"建表失败");
        }
    }
    self.db = db;
}

- (void)insertDb {
    for (int i = 0; i < 100; i++) {
        NSString *name = [NSString stringWithFormat:@"jack-%d", arc4random_uniform(100)];
        [self.db executeUpdate:@"INSERT INTO t_student (name, age) VALUES (?, ?);", name, @(arc4random_uniform(40))];
    }
}

- (void)deleteDb {
    [self.db executeUpdate:@"DROP TABLE IF EXISTS t_student;"];
    [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
}

- (void)queryDb {
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM t_student"];
    while ([resultSet next]) {
        int ID = [resultSet intForColumn:@"id"];
        NSString *name = [resultSet stringForColumn:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"%d %@ %D", ID, name, age);
    }
}

- (IBAction)creatDataBase:(id)sender {
    [self creatDb];
}

- (IBAction)insertDataBase:(id)sender {
    [self insertDb];
}

- (IBAction)queryDataBase:(id)sender {
    [self queryDb];
}

- (IBAction)deleteDataBase:(id)sender {
    [self deleteDb];
}
@end
