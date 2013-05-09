郭虹宇  22:02:18
		[_scroll showHeaderLoader:YES animated:NO];

郭虹宇  22:02:27
- (void)handleUISignal_BeeUIScrollView:(BeeUISignal *)signal
{
	[super handleUISignal:signal];
	
	if ( [signal is:BeeUIScrollView.HEADER_REFRESH] )
	{
		[self.model fetchFirstPage];
	}
	else if ( [signal is:BeeUIScrollView.REACH_BOTTOM] )
	{
		[self.model fetchNextPage];
	}
}

郭虹宇  22:02:47
- (void)handleMessage:(BeeMessage *)msg
{
			[_scroll setHeaderLoading:msg.sending];
			
			
			