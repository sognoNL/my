//
//  ArystringViewController.m
//  UtilDemo
//
//  Created by NL on 15-3-27.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import "ArystringViewController.h"

@interface ArystringViewController ()
{
    IBOutlet UITextView *textView;
}
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation ArystringViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _loadTextView];
    [self _aboutNSString];
    [self _aboutNSArray];
    [self _aboutEnumerator];
}

- (void)_loadTextView
{
    textView.text= @"详见代码";
}

- (void)_aboutNSString
{
    /*******************************************************************************************
     NSString
     *******************************************************************************************/
    //一、NSString
    /*----------------创建字符串的方法----------------*/
    
    //1、创建常量字符串。
    NSString *astring1 = @"This is a String!";
    NSLog(@"astring1:%@",astring1);
    
    //2、创建空字符串，给予赋值。
    NSString *astring2 = [[NSString alloc] init];
    astring2 = @"This is a String!";
    NSLog(@"astring2:%@",astring2);
    
    //3、在以上方法中，提升速度:initWithString方法
    NSString *astring3 = [[NSString alloc] initWithString:@"This is a String!"];
    NSLog(@"astring3:%@",astring3);
    
    //4、用标准c创建字符串:initWithCString方法
    char *Cstring = "This is a String!";
    NSString *astring4 = [[NSString alloc] initWithCString:Cstring];
    NSLog(@"astring4:%@",astring4);
    
    //5、创建格式化字符串:占位符（由一个%加一个字符组成）
    int i = 1;
    int j = 2;
    NSString *astring5 = [[NSString alloc] initWithString:[NSString stringWithFormat:@"%d.This is %i string!",i,j]];
    NSLog(@"astring5:%@",astring5);

    //6、创建临时字符串
    NSString *astring6;
    astring6 = [NSString stringWithCString:"This is a temporary string"];
    
    /*----------------7、从文件读取字符串:initWithContentsOfFile方法----------------*/
    NSString *path7 = @"astring.text";
    NSString *astring7 = [[NSString alloc] initWithContentsOfFile:path7];
    NSLog(@"astring:%@",astring7);
    
    /*----------------8、写字符串到文件:writeToFile方法----------------*/
    NSString *astring8 = [[NSString alloc] initWithString:@"This is a String!"];
    NSLog(@"astring:%@",astring8);
    NSString *path8 = @"astring.text";
    [astring8 writeToFile:path8 atomically:YES];
    
    /*----------------9、比较两个字符串----------------*/
    //用C比较:strcmp函数
    char string1[] = "string!";
    char string2[] = "string!";
    if(strcmp(string1, string2) == 0)
    {
        NSLog(@"1");
    }
    
    //10、isEqualToString方法
    NSString *astring101 = @"This is a String!";
    NSString *astring102 = @"This is a String!";
    BOOL result10 = [astring101 isEqualToString:astring102];
    NSLog(@"result:%d",result10);

    /*-------------------compare方法(comparer返回的三种值)---------------*/
    //11、NSOrderedSame判断两者内容是否相同
    NSString *astring111 = @"This is a String!";
    NSString *astring112 = @"This is a String!";
    BOOL result11 = [astring111 compare:astring112] == NSOrderedSame;
    NSLog(@"result:%d",result11);
    
    //12、NSOrderedAscending判断两对象值的大小(按字母顺序进行比较，astring02大于astring01为真)
    NSString *astring121 = @"This is a String!";
    NSString *astring122 = @"this is a String!";
    BOOL result12 = [astring121 compare:astring122] == NSOrderedAscending;
    NSLog(@"result:%d",result12);
    
    //13、NSOrderedDescending判断两对象值的大小(按字母顺序进行比较，astring02小于astring01为真)
    NSString *astring131 = @"this is a String!";
    NSString *astring132 = @"This is a String!";
    BOOL result13 = [astring131 compare:astring132] == NSOrderedDescending;
    NSLog(@"result:%d",result13);

    //14、不考虑大小写比较字符串1
    //NSOrderedDescending判断两对象值的大小(按字母顺序进行比较，astring02小于astring01为真)
    NSString *astring141 = @"this is a String!";
    NSString *astring142 = @"This is a String!";
    BOOL result14 = [astring141 caseInsensitiveCompare:astring142] == NSOrderedSame;
    NSLog(@"result:%d",result14);
    
    //15、不考虑大小写比较字符串2
    NSString *astring151 = @"this is a String!";
    NSString *astring152 = @"This is a String!";
    BOOL result15 = [astring151 compare:astring152
                             options:NSCaseInsensitiveSearch | NSNumericSearch] == NSOrderedSame;
    NSLog(@"result:%d",result15);
    //NSCaseInsensitiveSearch:不区分大小写比较 NSLiteralSearch:进行完全比较，区分大小写 NSNumericSearch:比较字符串的字符个数，而不是字符值。
    
    /*----------------16、改变字符串的大小写----------------*/
    NSString *string161 = @"A String";
    NSString *string162 = @"String";
    NSLog(@"string161:%@",[string161 uppercaseString]);//大写
    NSLog(@"string162:%@",[string162 lowercaseString]);//小写
    NSLog(@"string162:%@",[string162 capitalizedString]);//首字母大小
    
    /*----------------17、在串中搜索子串----------------*/
    NSString *string171 = @"This is a string";
    NSString *string172 = @"string";
    NSRange range = [string171 rangeOfString:string172];
    NSUInteger location = range.location;
    NSUInteger leight = range.length;
    NSString *astring = [[NSString alloc] initWithString:[NSString stringWithFormat:@"Location:%lu,Leight:%lu",location,leight]];
    NSLog(@"astring:%@",astring);
    
    /*----------------抽取子串 ----------------*/
    //18、 -substringToIndex: 从字符串的开头一直截取到指定的位置，但不包括该位置的字符
    NSString *string181 = @"This is a string";
    NSString *string182 = [string181 substringToIndex:3];
    NSLog(@"string182:%@",string182);

    //19、-substringFromIndex: 以指定位置开始（包括指定位置的字符），并包括之后的全部字符
    NSString *string191 = @"This is a string";
    NSString *string192 = [string191 substringFromIndex:3];
    NSLog(@"string192:%@",string192);

    //20、-substringWithRange: //按照所给出的位置，长度，任意地从字符串中截取子串
    NSString *string201 = @"This is a string";
    NSString *string202 = [string201 substringWithRange:NSMakeRange(0, 4)];
    NSLog(@"string202:%@",string202);
    
    //21、扩展路径
    NSString *Path21 = @"~/NSData.txt";
    NSString *absolutePath = [Path21 stringByExpandingTildeInPath];
    NSLog(@"absolutePath:%@",absolutePath);
    NSLog(@"Path:%@",[absolutePath stringByAbbreviatingWithTildeInPath]);
    
    //22、文件扩展名
    NSString *Path22 = @"~/NSData.txt";
    NSLog(@"Extension:%@",[Path22 pathExtension]);
    
    /*******************************************************************************************
     NSMutableString
     *******************************************************************************************/
    
    /*---------------给字符串分配容量----------------*/
    //stringWithCapacity:
    NSMutableString *String;
    String = [NSMutableString stringWithCapacity:40];
    
    /*---------------在已有字符串后面添加字符----------------*/
    
    //appendString: and appendFormat:
    
    NSMutableString *String1 = [[NSMutableString alloc] initWithString:@"This is a NSMutableString"];
    //[String1 appendString:@", I will be adding some character"];
    [String1 appendFormat:[NSString stringWithFormat:@", I will be adding some character"]];
    NSLog(@"String1:%@",String1);
    
    /*--------在已有字符串中按照所给出范围和长度删除字符------*/
    /*
     //deleteCharactersInRange:
     NSMutableString *String1 = [[NSMutableString alloc] initWithString:@"This is a NSMutableString"];
     [String1 deleteCharactersInRange:NSMakeRange(0, 5)];
     NSLog(@"String1:%@",String1);*/
     
    /*--------在已有字符串后面在所指定的位置中插入给出的字符串------*/
    
    //-insertString: atIndex:
    NSMutableString *String2 = [[NSMutableString alloc] initWithString:@"This is a NSMutableString"];
    [String2 insertString:@"Hi! " atIndex:0];
    NSLog(@"String1:%@",String2);

    /*--------将已有的空符串换成其它的字符串------*/
    
    //-setString:
    NSMutableString *String3 = [[NSMutableString alloc] initWithString:@"This is a NSMutableString"];
    [String3 setString:@"Hello Word!"];
    NSLog(@"String1:%@",String3);

    /*--------按照所给出的范围，和字符串替换的原有的字符------*/
    
    //-setString:
    NSMutableString *String4 = [[NSMutableString alloc] initWithString:@"This is a NSMutableString"];
    [String4 replaceCharactersInRange:NSMakeRange(0, 4) withString:@"That"];
    NSLog(@"String1:%@",String4);

    /*-------------判断字符串内是否还包含别的字符串(前缀，后缀)-------------*/
    //01：检查字符串是否以另一个字符串开头- (BOOL) hasPrefix: (NSString *) aString;
    NSString *String5 = @"NSStringInformation.txt";
    [String5 hasPrefix:@"NSString"] == 1 ?  NSLog(@"YES") : NSLog(@"NO");
    [String5 hasSuffix:@".txt"] == 1 ?  NSLog(@"YES") : NSLog(@"NO");
    
    //02：查找字符串某处是否包含其它字符串 - (NSRange) rangeOfString: (NSString *) aString，这一点前面在串中搜索子串用到过;
}

- (void)_aboutNSArray
{
    /*******************************************************************************************
     NSArray
     *******************************************************************************************/
    
    /*---------------------------1、创建数组------------------------------*/
    NSArray *array1 = [[NSArray alloc] initWithObjects:
    @"One",@"Two",@"Three",@"Four",nil];
    
    self.dataArray = array1;
    
    //- (unsigned) Count;数组所包含对象个数；
    NSLog(@"self.dataArray cound:%ld",[self.dataArray count]);
    
    //- (id) objectAtIndex: (unsigned int) index;获取指定索引处的对象;
    NSLog(@"self.dataArray cound 2:%@",[self.dataArray objectAtIndex:2]);
    
    
    /*--------------------------2、从一个数组拷贝数据到另一数组(可变数级)----------------------------*/
        //arrayWithArray:
    NSArray *array2 = [[NSArray alloc] init];
    NSMutableArray *MutableArray = [[NSMutableArray alloc] init];
    NSArray *array21 = [NSArray arrayWithObjects:
                      @"a",@"b",@"c",nil];
    NSLog(@"array:%@",array21);
    MutableArray = [NSMutableArray arrayWithArray:array21];
    NSLog(@"MutableArray:%@",MutableArray);
    
    array2 = [NSArray arrayWithArray:array21];
    NSLog(@"array1:%@",array2);
    
    //3、Copy
    id obj;
    NSMutableArray *newArray3 = [[NSMutableArray alloc] init];
    NSArray *oldArray3 = [NSArray arrayWithObjects:
                         @"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",nil];
    NSLog(@"oldArray:%@",oldArray3);
    for(int i = 0; i < [oldArray3 count]; i++)
    {
        obj = [[oldArray3 objectAtIndex:i] copy];
        [newArray3 addObject: obj];
    }
    NSLog(@"newArray:%@", newArray3);
    
    //4、快速枚举
    NSMutableArray *newArray4 = [[NSMutableArray alloc] init];
    NSArray *oldArray4 = [NSArray arrayWithObjects:
                         @"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",nil];
    NSLog(@"oldArray:%@",oldArray4);
    for(id obj in oldArray4)
    {
        [newArray4 addObject: obj];
    }
    NSLog(@"newArray:%@", newArray4);
    
    //5、Deep copy
    NSMutableArray *newArray5 = [[NSMutableArray alloc] init];
    NSArray *oldArray5 = [NSArray arrayWithObjects:
                         @"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",nil];
    NSLog(@"oldArray:%@",oldArray5);
    newArray5 = (NSMutableArray*)CFBridgingRelease(CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (CFPropertyListRef)oldArray5, kCFPropertyListMutableContainers));
    NSLog(@"newArray:%@", newArray5);
    
    
    //6、Copy and sort
    NSMutableArray *newArray6 = [[NSMutableArray alloc] init];
    NSArray *oldArray6 = [NSArray arrayWithObjects:
                         @"b",@"a",@"e",@"d",@"c",@"f",@"h",@"g",nil];
    NSLog(@"oldArray6:%@",oldArray6);
    NSEnumerator *enumerator;
    enumerator = [oldArray6 objectEnumerator];
    id obj6;
    while(obj6 = [enumerator nextObject])
    {
        [newArray6 addObject: obj6];
    }
    [newArray6 sortUsingSelector:@selector(compare:)];
    NSLog(@"newArray6:%@", newArray6);
    
    /*---------------------------切分数组------------------------------*/
    
    //7、从字符串分割到数组－ componentsSeparatedByString:
    NSString *string7 = [[NSString alloc] initWithString:@"One,Two,Three,Four"];
    NSLog(@"string7:%@",string7);
    NSArray *array7 = [string7 componentsSeparatedByString:@","];
    NSLog(@"array7:%@",array7);

    //8、从数组合并元素到字符串- componentsJoinedByString:
    NSArray *array8 = [[NSArray alloc] initWithObjects:@"One",@"Two",@"Three",@"Four",nil];
    NSString *string8 = [array8 componentsJoinedByString:@","];
    NSLog(@"string8:%@",string8);

    /*******************************************************************************************
     NSMutableArray
     *******************************************************************************************/
    /*---------------9、给数组分配容量----------------*/
    NSArray *array9;
    array9 = [NSMutableArray arrayWithCapacity:20];

    /*--------------10、在数组末尾添加对象----------------*/
    //- (void) addObject: (id) anObject;
    NSMutableArray *array10 = [NSMutableArray arrayWithObjects:
    @"One",@"Two",@"Three",nil];
    [array10 addObject:@"Four"];
    NSLog(@"array10:%@",array10);
    
    /*--------------11、删除数组中指定索引处对象----------------*/
    //-(void) removeObjectAtIndex: (unsigned) index;
    NSMutableArray *array11 = [NSMutableArray arrayWithObjects:
    @"One",@"Two",@"Three",nil];
    [array11 removeObjectAtIndex:1];
    NSLog(@"array11:%@",array11);
    
    
    /*******************************************************************************************
     NSDictionary
     *******************************************************************************************/
    
    /*------------------------------------1、创建字典------------------------------------*/
    //- (id) initWithObjectsAndKeys;
    
    NSDictionary *dictionary1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"One",@"1",@"Two",@"2",@"Three",@"3",nil];
    NSString *string1 = [dictionary1 objectForKey:@"One"];
    NSLog(@"string1:%@",string1);
    NSLog(@"dictionary1:%@",dictionary1);
    
    /*******************************************************************************************
     NSMutableDictionary
     *******************************************************************************************/
    
    /*------------------------------------2、创建可变字典------------------------------------*/
    //创建
    NSMutableDictionary *dictionary2 = [NSMutableDictionary dictionary];
    
    //添加字典
    [dictionary2 setObject:@"One" forKey:@"1"];
    [dictionary2 setObject:@"Two" forKey:@"2"];
    [dictionary2 setObject:@"Three" forKey:@"3"];
    [dictionary2 setObject:@"Four" forKey:@"4"];
    NSLog(@"dictionary2:%@",dictionary2);
    
    //删除指定的字典
    [dictionary2 removeObjectForKey:@"3"];
    NSLog(@"dictionary2:%@",dictionary2);
    
    /*******************************************************************************************
     NSValue（对任何对象进行包装）
     *******************************************************************************************/
    
    /*--------------------------------3、将NSRect放入NSArray中------------------------------------*/
    //将NSRect放入NSArray中
    NSMutableArray *array3 = [[NSMutableArray alloc] init];
    NSValue *value;
    CGRect rect = CGRectMake(0, 0, 320, 480);    
    value = [NSValue valueWithBytes:&rect objCType:@encode(CGRect)];
    [array3 addObject:value];
    NSLog(@"array:%@",array3);
    
    //从Array中提取
    value = [array3 objectAtIndex:0];
    [value getValue:&rect];
    NSLog(@"value:%@",value);
    
}
- (void)_aboutEnumerator
{
    /*******************************************************************************************
     从目录搜索扩展名为jpg的文件
     *******************************************************************************************/
    
    /*-------------数组枚举---------------*/
    //1、- (NSEnumerator *)objectEnumerator;从前向后
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:
                             @"One",@"Two",@"Three",nil];
    NSEnumerator *enumerator1;
    enumerator1 = [array1 objectEnumerator];
    id thingie;
    while (thingie = [enumerator1 nextObject]) {
        NSLog(@"thingie:%@",thingie);
    }

    //2、- (NSEnumerator *)reverseObjectEnumerator;从后向前
    NSMutableArray *array2 = [NSMutableArray arrayWithObjects:
    @"One",@"Two",@"Three",nil];
    NSEnumerator *enumerator2;
    enumerator2 = [array2 reverseObjectEnumerator];
    
    id object;
    while (object = [enumerator2 nextObject]) {
        NSLog(@"object:%@",object);
    }
    
    
    //3、快速枚举
    NSMutableArray *array3 = [NSMutableArray arrayWithObjects:
    @"One",@"Two",@"Three",nil];
    for(NSString *string in array3)
    {
        NSLog(@"string:%@",string);
    }

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *home;
    home = @"../Users/netease/Desktop/";
    NSDirectoryEnumerator *direnum;
    direnum = [fileManager enumeratorAtPath: home];
    NSMutableArray *files = [[NSMutableArray alloc] init];

    //4、枚举
    NSString *filename;
    while (filename = [direnum nextObject]) {
        if([[filename pathExtension] hasSuffix:@"jpg"]){
            [files addObject:filename];
        }
    }

    //快速枚举
    //for(NSString *filename in direnum)
    //{
    //    if([[filename pathExtension] isEqualToString:@"jpg"]){
    //        [files addObject:filename];
    //    }
    //}
    NSLog(@"files:%@",files);
    
    //枚举
    NSEnumerator *filenum;
    filenum = [files objectEnumerator];
    while (filename = [filenum nextObject]) {
        NSLog(@"filename:%@",filename);
    }
    
    //快速枚举
    for(id object in files)
    {
        NSLog(@"object:%@",object);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
