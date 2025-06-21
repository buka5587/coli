(function() {
    // 检测设备是否为平板（通过用户代理和屏幕特性）
    function isTablet() {
        const ua = navigator.userAgent.toLowerCase();
        const isiPad = /ipad/.test(ua);
        const isAndroidTablet = /android/.test(ua) && !/mobile/.test(ua);
        const isWindowsTablet = /windows/.test(ua) && /touch/.test(ua);
        
        // 屏幕尺寸辅助判断（平板常见分辨率范围）
        const screenWidth = screen.width;
        const screenHeight = screen.height;
        const diagonal = Math.sqrt(Math.pow(screenWidth, 2) + Math.pow(screenHeight, 2)) / 96; // 英寸
        const isScreenSizeTablet = diagonal >= 7 && diagonal <= 12;

        return isiPad || isAndroidTablet || isWindowsTablet || isScreenSizeTablet;
    }

    // 显示提示（带有防抖和会话存储记录）
    function showWarningIfNeeded() {
        const viewportWidth = Math.max(document.documentElement.clientWidth || 0, window.innerWidth || 0);
        
        if (viewportWidth >= 1200 && isTablet()) {
            // 每会话最多提示一次
            if (!sessionStorage.getItem('tabletWarningShown')) {
                alert('如果您使用平板，请手动关闭浏览器PC模式以获得最佳体验！');
                sessionStorage.setItem('tabletWarningShown', 'true');
            }
        }
    }

    // 初始化监听
    document.addEventListener('DOMContentLoaded', function() {
        // 页面加载时检测
        showWarningIfNeeded();
        
        // 窗口大小变化时检测（带防抖）
        let resizeTimer;
        window.addEventListener('resize', () => {
            clearTimeout(resizeTimer);
            resizeTimer = setTimeout(showWarningIfNeeded, 300);
        });
    });
})();