# VOScroll - VoiceOver navigation in horizontal UIScrollView

Sample exploring VoiceOver navigation among elements which are subviews of a horizontal UIScrollView.

Try navigation in Portrait and Landscape mode while VoiceOver is active, using for example flick right/left.

Upper scroll view is created by adding subviews to a standard UIScrollView.

Lower scroll view is similar, but uses a subclass of UIScrollView which implements the UIAccessibilityContainer protocol.

Summary of testing on devices with different iOS versions (mixture of iPhone, iPad, iPod Touch):

|  iOS           |  PT-ACP  | LS-ACP |  PT+ACP |  LS+ACP       |
|--------------- |----------|--------|---------|---------------|
|  7.0.3, 7.1.1  |  N       | N      |  Y      |  Y            |
|  8.0, 8.1      |  N       | Y      |  Y      |  Y            |
|  8.2           |  N       | Y      |  Y      |  Y            |
|  8.3           |  N       | Y      |  N      |  Y            |

Key:
PT=Portrait; LS=Landscape; -ACP=UIAccessibilityContainer protocol not implemented; +ACP=UIAccessibilityContainer protocol implemented; Y=Can navigate to elements which are completely off-screen; N=Cannot navigate to elements which are completely off-screen.

It appears that iOS 8 added the ability to navigate to unseen elements, but in Landscape only.

However, iOS 8.3 apparently removed the ability to navigate to unseen elements when UIAccessibilityContainer protocol is implemented.
