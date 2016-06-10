//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Betty Fung on 6/9/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (nonatomic, readwrite) NSString *sentence;

@end


@implementation FISSentence


//PRIVATE METHODS (are private as long as they're only found here in the .m file)

-(void)assembleSentence{
    
    self.sentence = [self.words componentsJoinedByString:@" "];
    self.sentence = [self.sentence stringByAppendingString:self.punctuation];
    
    //returns nothing
}



-(BOOL)validWord:(NSString *)word{
    
    if([word length] == 0 || [word isEqualToString:@" "]){
        //cannot be [word length] > 0 || ![word isEqualToString:@" "] ... this will not work/pass the test
        return NO;
    }
    
    return YES;
}


-(BOOL)validPunctuation:(NSString *)punctuation{
    
    NSArray *punctuations = @[@".", @"?", @"!", @",", @";", @":", @"—"];
    
    if([punctuation isEqualToString:@" "] || [punctuation length] == 0 || ![punctuations containsObject:punctuation]){
        return NO;
    }
    
    return YES;
}


-(BOOL)validIndex:(NSUInteger )index{
    
    NSUInteger bounds = [self.words count]-1;
    
    if(index <= bounds){
        return YES;
    }
    
    return NO;
}





//PUBLIC METHODS
-(void)addWord:(NSString *)word{
    
    // self.words = [[NSMutableArray alloc] init];
    // do not need to initialize!!! this causes an error and even though the words are adding through NSLog, does not pass test, need to ask for further clarification

    if([self validWord:word]){
        [self.words addObject:word];
    }

    [self assembleSentence];
    
    //returns nothing
    }



-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation{
    
    if([words count] == 0 || ![self validPunctuation:punctuation]){
        return;
    }
    else {
        for(NSString *wordInArray in words){
            [self addWord:wordInArray];
        }
        self.punctuation = punctuation;
    }
    
    [self assembleSentence];
    //returns nothing
}



-(void)removeWordAtIndex:(NSUInteger)index{
    
    if([self validIndex:index]){
        [self.words removeObjectAtIndex:index];
    }
    else{
        return; 
    }
    
    [self assembleSentence];
    //returns nothing
}



-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index{
    
    if([self validWord:word] && [self validIndex:index]){
        [self.words insertObject:word atIndex:index];
    }
    //do not need an else statement that does "return;" when this was included, the return was nil/null
    
    [self assembleSentence];
    //returns nothing
}



-(void)replacePunctuationWithPunctuation:(NSString *)punctuation{
    
    if([self validPunctuation:punctuation]){
        self.punctuation = punctuation; 
    }
    
    [self assembleSentence];
    //returns nothing
}



-(void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word{
    
    if([self validWord:word] && [self validIndex:index]){
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    
    [self assembleSentence];
    //returns nothing
}


@end
