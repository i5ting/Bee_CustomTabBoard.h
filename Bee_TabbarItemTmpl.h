//
//  Bee_TabbarItemTmpl.h
//  SimpleEKDemo
//
//  Created by sang alfred on 5/5/13.
//
//

#import <UIKit/UIKit.h>
 

@protocol CustomTabbarDelegate;

@interface Bee_TabbarItemTmpl : UIView
{
    int __count;
}

@property (nonatomic, assign) id<CustomTabbarDelegate> delegate;

// _customView = [[Bee_TabbarItem1 alloc] initWithFrame:CGRectMake(0, 0, 320, 44) andBundleName:__bundleName andConfigArray:__controllerArray];

@property (assign, nonatomic) CGRect viewframe;
@property (retain, nonatomic) NSArray *configArray;
@property (retain, nonatomic) NSString *bundleName;

@property (retain, nonatomic) IBOutlet UIImageView *highlightView;

@property (retain, nonatomic) IBOutlet UIImageView *indicator0;
@property (retain, nonatomic) IBOutlet UIImageView *indicator1;
@property (retain, nonatomic) IBOutlet UIImageView *indicator2;
@property (retain, nonatomic) IBOutlet UIImageView *indicator3;
@property (retain, nonatomic) IBOutlet UILabel *updateLabel0;
@property (retain, nonatomic) IBOutlet UILabel *updateLabel1;
@property (retain, nonatomic) IBOutlet UILabel *updateLabel2;
@property (retain, nonatomic) IBOutlet UILabel *updateLabel3;


-(void)showTab;
- (void)selectTabAtIndex:(int)index;
- (id)initWithFrame:(CGRect)frame andBundleName:(NSString *)bundleName andConfigArray:(NSArray *)configArray;

@end



@protocol CustomTabbarDelegate <NSObject>

@required

- (CGRect)set_init_heigh_light_view_frame;
- (CGRect)set_after_animate_light_view_frame_with_prev_frame:(CGRect)prev_frame and_index:(int)index;
- (CGRect)set_init_image_button_view_frame_with_index:(int)index;


@optional
- (void)tap_on_btn_call_back:(int)index;
- (void)draw_with_dict:(NSDictionary *)d in_container:(UIView *)view;
- (void)customTabbar:(Bee_TabbarItemTmpl*)customTabbar didSelectTab:(int)tabIndex;


@end