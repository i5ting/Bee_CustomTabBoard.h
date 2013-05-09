//
//	 ______    ______    ______    
//	/\  __ \  /\  ___\  /\  ___\   
//	\ \  __<  \ \  __\_ \ \  __\_ 
//	 \ \_____\ \ \_____\ \ \_____\ 
//	  \/_____/  \/_____/  \/_____/ 
//
//	Copyright (c) 2012 BEE creators
//	http://www.whatsbug.com
//
//	Permission is hereby granted, free of charge, to any person obtaining a
//	copy of this software and associated documentation files (the "Software"),
//	to deal in the Software without restriction, including without limitation
//	the rights to use, copy, modify, merge, publish, distribute, sublicense,
//	and/or sell copies of the Software, and to permit persons to whom the
//	Software is furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//	IN THE SOFTWARE.
//
//
//  CommonPullLoader.m
//

#import "CommonPullLoader.h"

#pragma mark -

@implementation CommonPullLoader

+ (void)load
{
	[BeeUIPullLoader setDefaultSize:CGSizeMake(200, 50)];
	[BeeUIPullLoader setDefaultClass:[CommonPullLoader class]];
}

- (void)load
{
	[super load];
	
	self.FROM_RESOURCE( @"PullLoader.xml" );
	
	$(@"arrow").IMAGE( @"" );
	$(@"state").TEXT( @"下拉更新" );
	$(@"date").TEXT( @"最后更新：%@", [[NSDate date] stringWithDateFormat:@"yyyy年MM月dd日"] );
}

- (void)unload
{
	[super unload];
}

- (void)handleUISignal:(BeeUISignal *)signal
{
	[super handleUISignal:signal];

	BeeUIImageView *				arrow = (BeeUIImageView *)$(@"arrow").view;
	BeeUIActivityIndicatorView *	indicator = (BeeUIActivityIndicatorView *)$(@"ind").view;

	if ( [signal is:BeeUIPullLoader.STATE_CHANGED] )
	{
		if ( BeeUIPullLoader.STATE_NORMAL == self.state )
		{
			arrow.hidden = NO;
			arrow.transform = CGAffineTransformIdentity;
			
			[indicator stopAnimating];
			
			$(@"state").TEXT( @"下拉刷新" );
			$(@"date").TEXT( @"最后更新：%@", [[NSDate date] stringWithDateFormat:@"yyyy年MM月dd日"] );
		}
		else if ( BeeUIPullLoader.STATE_PULLING == self.state )
		{
			arrow.hidden = NO;
			arrow.transform = CGAffineTransformRotate( CGAffineTransformIdentity, (M_PI / 360.0f) * -359.0f );
			
			$(@"state").TEXT( @"释放刷新" );
			$(@"date").TEXT( @"最后更新：%@", [[NSDate date] stringWithDateFormat:@"yyyy年MM月dd日"] );
		}
		else if ( BeeUIPullLoader.STATE_LOADING == self.state )
		{
			[indicator startAnimating];

			arrow.hidden = YES;
			
			$(@"state").TEXT( @"正在加载..." );
			$(@"date").TEXT( @"最后更新：%@", [[NSDate date] stringWithDateFormat:@"yyyy年MM月dd日"] );
		}
	}
	else if ( [signal is:BeeUIPullLoader.FRAME_CHANGED] )
	{
		self.RELAYOUT();
	}
}

@end
