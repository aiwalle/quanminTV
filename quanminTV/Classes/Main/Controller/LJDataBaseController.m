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
@property (weak, nonatomic) IBOutlet UIImageView *testImgeView;

@end

@implementation LJDataBaseController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)creatDb {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [doc stringByAppendingPathComponent:@"student.sqlite"];
    FMDatabase *db = [FMDatabase databaseWithPath:fileName];
    self.db = db;
    if ([db open]) {
        BOOL result=[db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text, age integer, image blob);"];
        if (result) {
            NSLog(@"建表成功");
        }else {
            NSLog(@"建表失败");
        }
    }else {
        NSLog(@"打开数据库失败");
    }
    [self.db close];
}

- (void)insertDb {
    if ([self.db open]) {
        for (int i = 0; i < 100; i++) {
            NSString *name = [NSString stringWithFormat:@"jack-%d", arc4random_uniform(100)];
            [self.db executeUpdate:@"INSERT INTO t_student (name, age) VALUES (?, ?);", name, @(arc4random_uniform(40))];
        }
        NSLog(@"插入数据成功");
    }else {
        NSLog(@"数据库打开失败");
    }
    [self.db close];
}

- (void)deleteDb {
    if ([self.db open]) {
        [self.db executeUpdate:@"DROP TABLE IF EXISTS t_student;"];
        [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text, age integer);"];
        NSLog(@"删除表格成功");
    }else {
        NSLog(@"删除表格失败");
    }
    [self.db close];
}

- (void)queryDb {
    if ([self.db open]) {
        FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM t_student"];
        while ([resultSet next]) {
            int ID = [resultSet intForColumn:@"id"];
            NSString *name = [resultSet stringForColumn:@"name"];
            int age = [resultSet intForColumn:@"age"];
            NSLog(@"%d %@ %D", ID, name, age);
        }
        NSLog(@"查询表单成功");
    }else {
        NSLog(@"查询表单失败");
    }
    [self.db close];
}

- (void)insertImagesToDB {
    [self.db open];
    if ([self.db open]) {
        NSData *data = UIImagePNGRepresentation([UIImage imageNamed:@"focus"]);
        BOOL flag = [self.db executeUpdate:@"INSERT INTO t_student (image) VALUES (?);", data];
        if (flag) {
            NSLog(@"插入图片成功");
        }else {
            NSLog(@"插入图片失败");
        }
    }
    [self.db close];
}

- (void)queryImagesToDB {
    [self.db open];
    if ([self.db open]) {
        FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM t_student"];
        while ([resultSet next]) {
            NSData *data = [resultSet dataForColumn:@"image"];
            UIImage *image = [UIImage imageWithData:data];
            self.testImgeView.image = image;
        }
    }
}

- (IBAction)creatDataBase:(id)sender {
    [self creatDb];
}

- (IBAction)insertDataBase:(id)sender {
    [self insertDb];
}

- (IBAction)queryDataBase:(id)sender {
    [self queryImagesToDB];
}

- (IBAction)deleteDataBase:(id)sender {
//    [self deleteDb];
    [self insertImagesToDB];
}
@end
